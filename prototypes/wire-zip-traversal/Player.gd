# PROTOTYPE - NOT FOR PRODUCTION
# Question: Does wire-zip traversal feel satisfying as a primary movement verb?
# Date: 2026-03-26
#
# TUNING KNOBS — adjust these during playtesting:
#   ZIP_SPEED: how fast the player travels along a wire (try 300-600)
#   GRAB_RADIUS: how close to a wire the player must be to grab (try 60-120)
#   LAUNCH_MULTIPLIER: velocity boost on wire exit (try 1.0-2.0)
#   SNAP_SPEED: how fast the player snaps onto the wire (try 10-20, or set huge for instant)
#
# HARDCODED VALUES ARE INTENTIONAL — this is a feel prototype, not production code.

extends CharacterBody2D

# ---- Movement constants ----
const WALK_SPEED       := 240.0
const JUMP_VELOCITY    := -520.0
const GRAVITY          := 980.0

# ---- Wire zip constants ----
const ZIP_SPEED          := 420.0
const GRAB_RADIUS        := 90.0
const LAUNCH_MULTIPLIER  := 1.3
const MIN_ZIP_PROGRESS   := 0.05  # don't snap to very end of wire on grab

# ---- State machine ----
enum State { NORMAL, ZIPPING }
var state: State = State.NORMAL

# ---- Zip state ----
var current_wire = null          # Wire node currently attached to
var zip_progress: float = 0.0   # 0.0 = wire start, 1.0 = wire end
var zip_forward: bool = true     # travelling toward point_b (true) or point_a (false)

# ---- Visual feedback (placeholder) ----
var _grab_flash_timer: float = 0.0


func _physics_process(delta: float) -> void:
	_grab_flash_timer = max(0.0, _grab_flash_timer - delta)

	match state:
		State.NORMAL:
			_process_normal(delta)
		State.ZIPPING:
			_process_zipping(delta)


# ---------- NORMAL state ----------

func _process_normal(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Horizontal movement
	var dir := Input.get_axis("move_left", "move_right")
	velocity.x = dir * WALK_SPEED

	# Wire grab attempt
	if Input.is_action_just_pressed("grab"):
		_try_grab_wire()

	move_and_slide()


# ---------- ZIPPING state ----------

func _process_zipping(delta: float) -> void:
	if current_wire == null:
		state = State.NORMAL
		return

	var wire_length: float = current_wire.get_wire_length()
	if wire_length <= 0.0:
		_release_wire()
		return

	# Move along wire
	var travel_delta := (ZIP_SPEED / wire_length) * delta
	if zip_forward:
		zip_progress += travel_delta
	else:
		zip_progress -= travel_delta

	# Clamp and check end-of-wire
	if zip_progress >= 1.0 or zip_progress <= 0.0:
		zip_progress = clamp(zip_progress, 0.0, 1.0)
		_release_wire()
		return

	# Update position
	position = current_wire.get_world_point_at(zip_progress)
	velocity = Vector2.ZERO  # suppress built-in physics while zipping

	# Early release
	if Input.is_action_just_pressed("grab"):
		_release_wire()


# ---------- Wire grab logic ----------

func _try_grab_wire() -> void:
	var wires := get_tree().get_nodes_in_group("wires")
	var nearest_wire = null
	var nearest_dist := GRAB_RADIUS
	var nearest_progress := 0.0

	for wire in wires:
		var result: Dictionary = wire.get_nearest_point(global_position)
		if result["distance"] < nearest_dist:
			nearest_dist = result["distance"]
			nearest_wire = wire
			nearest_progress = result["progress"]

	if nearest_wire == null:
		return  # Nothing in range — no grab

	current_wire = nearest_wire
	zip_progress = clamp(nearest_progress, MIN_ZIP_PROGRESS, 1.0 - MIN_ZIP_PROGRESS)

	# Determine travel direction: go toward whichever end is farther
	# (so the player always gets a meaningful zip, not a tiny hop)
	zip_forward = zip_progress < 0.5

	velocity = Vector2.ZERO
	state = State.ZIPPING
	_grab_flash_timer = 0.1  # quick visual flash (if you hook up a ColorRect modulate)


func _release_wire() -> void:
	# Launch in the travel direction
	var launch_dir: Vector2
	if zip_forward:
		launch_dir = current_wire.get_direction()
	else:
		launch_dir = -current_wire.get_direction()

	velocity = launch_dir * ZIP_SPEED * LAUNCH_MULTIPLIER

	current_wire = null
	state = State.NORMAL
