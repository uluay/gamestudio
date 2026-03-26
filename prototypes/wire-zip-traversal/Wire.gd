# PROTOTYPE - NOT FOR PRODUCTION
# Question: Does wire-zip traversal feel satisfying as a primary movement verb?
# Date: 2026-03-26
#
# Wire node: place in scene, set point_a and point_b in the Inspector.
# The wire draws itself using _draw(). No separate Line2D needed.
# Add this node to the "wires" group in the Node panel (or via add_to_group below).
#
# Suggested test wire configurations:
#   Horizontal: point_a = (-200, 0),  point_b = (200, 0)
#   Diagonal up: point_a = (-150, 100), point_b = (150, -100)
#   Steep diagonal: point_a = (-50, 200), point_b = (50, -200)

extends Node2D

@export var point_a: Vector2 = Vector2(-200.0, 0.0)
@export var point_b: Vector2 = Vector2(200.0, 0.0)

# Visual settings (prototype placeholders)
const WIRE_COLOR         := Color(1.0, 0.9, 0.2, 1.0)  # bright yellow
const WIRE_THICKNESS     := 4.0
const ENDPOINT_RADIUS    := 10.0
const ENDPOINT_COLOR     := Color(1.0, 0.5, 0.0, 1.0)  # orange
const GRAB_ZONE_COLOR    := Color(1.0, 1.0, 0.0, 0.08)  # faint yellow band

var _length: float = 0.0


func _ready() -> void:
	add_to_group("wires")
	_length = point_a.distance_to(point_b)
	queue_redraw()


# ---- Public API (called by Player.gd) ----

func get_wire_length() -> float:
	return _length


func get_direction() -> Vector2:
	if _length == 0.0:
		return Vector2.RIGHT
	return (point_b - point_a).normalized()


func get_world_point_at(progress: float) -> Vector2:
	## Returns a world-space position along the wire. progress is 0.0–1.0.
	return global_position + point_a.lerp(point_b, progress)


func get_nearest_point(world_pos: Vector2) -> Dictionary:
	## Returns {"distance": float, "progress": float, "world_point": Vector2}
	## distance = how far world_pos is from the closest point on this wire
	## progress = 0.0–1.0 position of that closest point along the wire
	var local_p := world_pos - global_position
	var ab := point_b - point_a
	var ap := local_p - point_a
	var t := 0.0
	var ab_sq := ab.dot(ab)
	if ab_sq > 0.0:
		t = clamp(ap.dot(ab) / ab_sq, 0.0, 1.0)
	var closest_local := point_a + t * ab
	var closest_world := global_position + closest_local
	return {
		"distance":    local_p.distance_to(closest_local),
		"progress":    t,
		"world_point": closest_world,
	}


# ---- Visuals (placeholder) ----

func _draw() -> void:
	# Draw grab-zone band (helps visualize GRAB_RADIUS)
	# Prototype only — remove in production
	draw_line(point_a, point_b, GRAB_ZONE_COLOR, 180.0)

	# Wire body
	draw_line(point_a, point_b, WIRE_COLOR, WIRE_THICKNESS)

	# Endpoints
	draw_circle(point_a, ENDPOINT_RADIUS, ENDPOINT_COLOR)
	draw_circle(point_b, ENDPOINT_RADIUS, ENDPOINT_COLOR)
