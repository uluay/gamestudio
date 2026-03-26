# Technical Preferences

<!-- Populated by /setup-engine. Updated as the user makes decisions throughout development. -->
<!-- All agents reference this file for project-specific standards and conventions. -->

## Engine & Language

- **Engine**: Godot 4.6
- **Language**: GDScript (primary), C++ via GDExtension (performance-critical only)
- **Rendering**: D3D12 (Windows default in 4.6), Vulkan (Linux/macOS)
- **Physics**: Jolt (3D, default in 4.6), Godot2D (2D — this project)

> **Knowledge Gap**: Godot 4.4–4.6 are beyond LLM training data.
> Always cross-reference `docs/engine-reference/godot/` before suggesting APIs.

## Naming Conventions

- **Classes**: PascalCase (e.g., `PlayerController`, `WireZipComponent`)
- **Variables/Functions**: snake_case (e.g., `move_speed`, `get_nearest_wire()`)
- **Signals**: snake_case, past tense verb (e.g., `health_changed`, `circuit_restored`)
- **Files**: snake_case matching class name (e.g., `player_controller.gd`)
- **Scenes**: PascalCase matching root node (e.g., `PlayerController.tscn`, `Apartment.tscn`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `MAX_HEALTH`, `WIRE_GRAB_RADIUS`)
- **Autoloads/Singletons**: PascalCase, suffix `Manager` or `Bus` (e.g., `AudioManager`, `EventBus`)
- **Enums**: PascalCase type, UPPER_SNAKE_CASE values (e.g., `enum State { IDLE, ZIPPING, SHOCKED }`)

## Performance Budgets

- **Target Framerate**: [TO BE CONFIGURED — typical: 60fps]
- **Frame Budget**: [TO BE CONFIGURED — typical: 16.6ms at 60fps]
- **Draw Calls**: [TO BE CONFIGURED — typical 2D: < 200 draw calls per frame]
- **Memory Ceiling**: [TO BE CONFIGURED — typical: < 512MB for PC demo]

> Suggestion: Set these when you run your first perf profile (`/perf-profile`).

## Testing

- **Framework**: GUT (Godot Unit Testing) — https://github.com/bitwes/Gut
- **Minimum Coverage**: [TO BE CONFIGURED — suggested: 80% for gameplay systems]
- **Required Tests**: Balance formulas, gameplay systems (wire-zip physics, shock hitbox)

## Forbidden Patterns

<!-- Add patterns that should never appear in this project's codebase -->
- **No hardcoded gameplay values** — all tunable values in exported `@export` vars or config resources
- **No `get_node()` with absolute paths** — use `@onready` + relative paths or signals
- **No `print()` in production paths** — use a debug flag or remove before ship
- [Add more as architectural decisions are made]

## Allowed Libraries / Addons

<!-- Add approved third-party dependencies here -->
- **GUT** — Godot Unit Testing framework (testing only, not shipped)
- [Add more as dependencies are approved via /architecture-decision]

## Architecture Decisions Log

<!-- Quick reference linking to full ADRs in docs/architecture/ -->
- [No ADRs yet — use /architecture-decision to create one]
