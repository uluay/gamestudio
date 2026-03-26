# Prototype: Wire-Zip Traversal

**Question**: Does grabbing a wire and sliding along it feel satisfying as a
primary movement verb?

**Engine**: Godot 4.6

---

## How to Run This Prototype

### 1. Create a new Godot 4.6 project

- Open Godot 4.6 → New Project → name it "WireZipTest"
- Copy `Player.gd` and `Wire.gd` into the project folder

### 2. Set up Input Actions

Go to **Project → Project Settings → Input Map** and add:

| Action | Key |
|--------|-----|
| `move_left` | Arrow Left or A |
| `move_right` | Arrow Right or D |
| `jump` | Space |
| `grab` | Z or Shift |

### 3. Build the Test Scene

Create a new scene (`TestRoom.tscn`) with this node tree:

```
TestRoom (Node2D)
├── Ground (StaticBody2D)
│   ├── CollisionShape2D  [RectangleShape2D: 1200 × 32]
│   └── ColorRect         [size: 1200 × 32, color: gray]
├── Platform1 (StaticBody2D)            ← position: (-300, -150)
│   ├── CollisionShape2D  [RectangleShape2D: 200 × 20]
│   └── ColorRect         [size: 200 × 20, color: gray]
├── Platform2 (StaticBody2D)            ← position: (100, -280)
│   ├── CollisionShape2D  [RectangleShape2D: 200 × 20]
│   └── ColorRect         [size: 200 × 20, color: gray]
├── Platform3 (StaticBody2D)            ← position: (350, -150)
│   ├── CollisionShape2D  [RectangleShape2D: 200 × 20]
│   └── ColorRect         [size: 200 × 20, color: gray]
├── Wire1 (Node2D + Wire.gd)            ← position: (-200, -200)
│   point_a = (-150, 0),  point_b = (150, -100)  [diagonal, crossing platforms]
├── Wire2 (Node2D + Wire.gd)            ← position: (50, -320)
│   point_a = (-100, 0),  point_b = (200, 80)    [reaches down to Platform2]
├── Wire3 (Node2D + Wire.gd)            ← position: (250, -200)
│   point_a = (-100, 50), point_b = (200, -50)   [diagonal up toward Platform3]
├── Player (CharacterBody2D + Player.gd)  ← position: (-400, -50)
│   ├── CollisionShape2D  [CapsuleShape2D: radius 16, height 48]
│   └── ColorRect         [size: 32 × 48, offset: (-16, -48), color: white]
└── Camera2D                            [attach to Player, or position: (0, -200)]
```

### 4. Run

Hit F5. The player should:
- Walk with Left/Right
- Jump with Space
- Grab nearby wires with Z (or Shift)

---

## What to Tune

All tuning constants are at the top of `Player.gd`:

```gdscript
const ZIP_SPEED          := 420.0   # try 300, 420, 550, 650
const GRAB_RADIUS        := 90.0    # try 60, 90, 120
const LAUNCH_MULTIPLIER  := 1.3     # try 1.0, 1.3, 1.8, 2.2
```

**Suggested test sequence:**
1. Default values first — feel the baseline
2. Halve `ZIP_SPEED` (210) — does slower feel more in-control or boring?
3. Double `ZIP_SPEED` (840) — does faster feel exciting or disorienting?
4. Set `GRAB_RADIUS` to 60 — does smaller radius feel more skill-based or frustrating?
5. Set `LAUNCH_MULTIPLIER` to 2.0 — does big launch feel satisfying or overpowered?

---

## What to Evaluate

Fill in `REPORT.md` after testing. Key questions:

1. **Snap feel**: When you press grab, does snapping to the wire feel satisfying or jarring?
2. **Zip speed**: At default ZIP_SPEED=420, does the traversal feel fast/fluid or slow/floaty?
3. **Direction logic**: Does auto-detecting "travel toward the farther end" feel natural?
4. **Launch feel**: Does releasing at the wire's end feel like a slingshot or a stumble?
5. **Grab radius**: At 90px, does grabbing wires feel precise or too magnetized?
6. **Core question**: Would you zip along wires *just for fun*, with no enemies or goals?
