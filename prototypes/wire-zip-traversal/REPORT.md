# Prototype Report: Wire-Zip Traversal

**Prototype**: wire-zip-traversal
**Date**: 2026-03-26
**Tester**: [your name]
**Engine**: Godot 4.6

---

## Hypothesis

Wire-zip traversal — grabbing a wire and auto-sliding along it with a launch at
the end — will feel satisfying as the *only* traversal verb in a 2D platformer.
Specifically:

1. The snap-to-wire moment will feel responsive and intentional (not sticky/random)
2. Sliding along the wire at ZIP_SPEED=420 will feel fast and fluid (not floaty)
3. The direction auto-detection (always travel toward farther end) will feel natural
4. The launch-off moment will feel like a slingshot (rewarding momentum)
5. Players will want to zip along wires repeatedly without external reward

---

## Approach

Built a minimal Godot 4.6 prototype with two scripts:
- `Player.gd`: CharacterBody2D with NORMAL/ZIPPING state machine
- `Wire.gd`: Node2D with math to find nearest point on line segment

Test room: 3 platforms, 3 wires at different angles (horizontal, diagonal up,
steep diagonal). No art, no audio, no enemies.

**Shortcuts taken** (intentional for prototype):
- Hardcoded values, no config files
- No animation — player is a white rectangle
- No audio — no zip sound
- No particle effects
- No coyote time, variable jump height, or other platformer polish
- Wire travel direction is auto-detected (not player-controlled)

---

## Result

> *Fill this in after running the prototype in Godot.*

**Snap feel**: [jarring / satisfying / neutral]

**Zip speed at default (420)**: [too slow / good / too fast]

**Best ZIP_SPEED found**: [value] — [why it felt better]

**Direction auto-detection**: [felt natural / felt wrong — describe when it failed]

**Launch feel**: [stumble / neutral / slingshot / overpowered]

**Best LAUNCH_MULTIPLIER found**: [value]

**Grab radius at default (90px)**: [too small / right / too magnetized]

**Core question answer**: Would you zip wires just for fun?
[Yes — felt like Spider-Man, wanted to keep going]
[Partial — fun sometimes but inconsistent]
[No — felt mechanical, not intrinsically enjoyable]

**Unexpected findings**:
[Note anything that surprised you during testing]

---

## Metrics

> *Fill in during testing. Be specific — "felt bad" is not a metric.*

| Metric | Value |
|--------|-------|
| ZIP_SPEED (baseline) | 420 |
| ZIP_SPEED (best feel) | TBD |
| GRAB_RADIUS (baseline) | 90 |
| GRAB_RADIUS (best feel) | TBD |
| LAUNCH_MULTIPLIER (baseline) | 1.3 |
| LAUNCH_MULTIPLIER (best feel) | TBD |
| Grab success rate (felt intentional) | TBD |
| Number of "oops wrong wire" moments in 10 min | TBD |
| Subjective fun rating (1–10, no external reward) | TBD |

---

## Recommendation: [PROCEED / PIVOT / KILL]

> *Fill in after testing.*

[Write one paragraph explaining the recommendation with evidence from testing.]

---

## If Proceeding

Production implementation requirements:
- Replace state machine with Godot AnimationPlayer or AnimationTree for blend
- Add coyote time and variable jump height to base platformer feel
- Wire detection: consider Area2D with CollisionShape2D instead of manual group query
  (more efficient, better integration with Godot physics)
- Add "grab indicator" — visual feedback showing which wire will be grabbed
- Add zip audio: whoosh SFX on grab, crack SFX on launch
- Wire travel direction: give player control (hold left/right to choose direction)
  rather than auto-detecting — more agency
- Add particle trail during zip (electric sparks along the wire)
- Consider curved wires (Path2D + PathFollow2D) if diagonal feel is insufficient
- Tune GRAB_RADIUS per-wire rather than globally (some wires easier to reach than others)

---

## If Pivoting

Alternative directions if wire-zip doesn't feel right:
- **Grappling hook**: Player aims and fires a hook, then reels in — more player control
  over targeting. Harder to implement, but more satisfying if zip auto-travel
  feels passive.
- **Wire dash**: Instead of sliding along the wire, pressing near a wire teleports
  the player to the other end (instant, no travel time). Loses the "fluid movement"
  feel but gains precision. More like a dash blink.
- **Magnetic climb**: Player sticks to metal surfaces and crawls — changes the game
  from "zipline platformer" to "gravity-defying climber." Different feel entirely.

---

## If Killing

If this fails:
- The core concept's Pillar 1 (Electrifying Movement) requires a satisfying
  traversal verb. Without it, the game concept must be redesigned from the
  brainstorm stage.
- The panda electrician identity can survive a different traversal verb, but
  "zipping along wires" is so central to the elevator pitch it would need to
  be replaced with something equally distinctive.

---

## Lessons Learned

> *Fill in after testing. Note anything that affects other systems.*

- Wire layout: [how many wires per room felt right?]
- Platform spacing: [what gap distance made zipping feel necessary vs. optional?]
- Vertical vs. horizontal: [which wire angle felt best?]
- Anything that affects Enemy AI design: [did enemies placed under wires feel threatening?]
- Anything that affects Level Design: [what room shape worked best for zipping?]
