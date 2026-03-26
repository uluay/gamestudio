# Systems Index: Live Wire

> **Status**: Draft
> **Created**: 2026-03-26
> **Last Updated**: 2026-03-26
> **Source Concept**: design/gdd/game-concept.md

---

## Overview

Live Wire is a 2D Metroidvania-lite platformer with two core verbs: zip (wire-based
traversal) and shock (melee combat). All 16 systems serve these two verbs and the
demo's emotional peak — the "lights-on" transformation when a fuse box is restored.

The system architecture is intentionally lean for a solo beginner demo: no save/load,
no inventory, no dialogue, no economy. Every system exists to make the core loop work
or to deliver the visual and audio feedback that makes the loop *feel* good.

Design and build order is strictly dependency-driven: Foundation → Core → Feature →
Presentation. The highest-risk system (Wire-Zip Traversal) should be **prototyped
before any other Feature-layer system is designed in detail.**

---

## Systems Enumeration

| # | System Name | Category | Priority | Status | Design Doc | Depends On |
|---|-------------|----------|----------|--------|------------|------------|
| 1 | Input System | Core | MVP | Not Started | — | — |
| 2 | Health System | Core | MVP | Not Started | — | — |
| 3 | Room State System | Persistence | MVP | Not Started | — | — |
| 4 | Audio Manager | Audio | Vertical Slice | Not Started | — | — |
| 5 | Player Controller | Core | MVP | Not Started | — | Input System |
| 6 | Camera System | Core | Vertical Slice | Not Started | — | Player Controller |
| 7 | Hit Detection | Gameplay | MVP | Not Started | — | Player Controller, Health System |
| 8 | Wire-Zip Traversal | Gameplay | MVP | Not Started | — | Player Controller, Input System |
| 9 | Shock Touch Combat | Gameplay | MVP | Not Started | — | Player Controller, Hit Detection, Health System |
| 10 | Enemy AI (Basic) | Gameplay | MVP | Not Started | — | Health System, Hit Detection |
| 11 | Death & Respawn | Gameplay | Vertical Slice | Not Started | — | Health System, Player Controller, Room State System |
| 12 | Fuse Box Restoration | Gameplay | MVP | Not Started | — | Player Controller, Room State System |
| 13 | Area Unlock Progression | Gameplay | Vertical Slice | Not Started | — | Room State System, Fuse Box Restoration |
| 14 | Visual Transformation | Presentation | MVP | Not Started | — | Room State System, Fuse Box Restoration |
| 15 | HUD | UI | Demo | Not Started | — | Health System, Player Controller |
| 16 | Main Menu / Game Over | UI | Demo | Not Started | — | Health System, Death & Respawn |

---

## Categories

| Category | Description | Systems in This Game |
|----------|-------------|----------------------|
| **Core** | Foundation systems everything depends on | Input System, Player Controller, Camera System, Health System |
| **Gameplay** | The systems that make the game fun | Wire-Zip Traversal, Shock Touch Combat, Hit Detection, Enemy AI, Death & Respawn, Fuse Box Restoration, Area Unlock Progression |
| **Persistence** | Save state and session continuity | Room State System |
| **Presentation** | Visual and audio feedback systems | Visual Transformation, Audio Manager |
| **UI** | Player-facing displays and menus | HUD, Main Menu / Game Over |

---

## Priority Tiers

| Tier | Definition | Systems |
|------|------------|---------|
| **MVP** | Required for core loop prototype: zip + shock + fuse box | Input, Health, Room State, Player Controller, Hit Detection, Wire-Zip, Shock Touch, Enemy AI, Fuse Box Restoration, Visual Transformation |
| **Vertical Slice** | Required for a complete, shareable demo experience | Camera System, Death & Respawn, Area Unlock Progression, Audio Manager |
| **Demo** | Required to publish on itch.io | HUD, Main Menu / Game Over |
| **Full Vision** | Post-demo expansion | (none defined yet) |

---

## Dependency Map

### Foundation Layer (no dependencies)

1. **Input System** — all player actions flow through here; nothing else can be
   designed until inputs are named and mapped
2. **Health System** — pure data and rules: HP values, damage calculation, death
   events; no gameplay dependencies
3. **Room State System** — stores which rooms are dark or lit; standalone data store
   that gameplay systems read/write
4. **Audio Manager** — listens to game events and plays SFX/music; no gameplay deps
   (designed after MVP to keep prototype lean)

### Core Layer (depends on Foundation)

5. **Player Controller** — base CharacterBody2D: walk, jump, gravity, collision
   — depends on: Input System
6. **Camera System** — smooth follow cam with room-aware bounds
   — depends on: Player Controller
7. **Hit Detection** — hitbox/hurtbox registration, overlap queries, damage dispatch
   — depends on: Player Controller, Health System

### Feature Layer (depends on Core)

8. **Wire-Zip Traversal** ⚠️ HIGH RISK — detect nearby wire, attach, slide/slingshot
   — depends on: Player Controller, Input System
9. **Shock Touch Combat** — charge state, melee hitbox activation, knockback, particles
   — depends on: Player Controller, Hit Detection, Health System
10. **Enemy AI (Basic)** — patrol state, detect player (proximity), react to shock (stun/die)
    — depends on: Health System, Hit Detection
11. **Death & Respawn** — player death trigger, respawn point, enemy reset on respawn
    — depends on: Health System, Player Controller, Room State System
12. **Fuse Box Restoration** — interact trigger at fuse box → set room state → fire event
    — depends on: Player Controller, Room State System
13. **Area Unlock Progression** — gates (doors, platforms, elevators) listen to Room State
    events and open/power-on when target room is restored
    — depends on: Room State System, Fuse Box Restoration

### Presentation Layer (depends on Feature)

14. **Visual Transformation** — handles the dark→lit moment: light fade-in, particle burst,
    color grade shift, background art swap
    — depends on: Room State System, Fuse Box Restoration
15. **HUD** — minimal health indicator (pip display or none for demo)
    — depends on: Health System, Player Controller
16. **Main Menu / Game Over** — start screen, death screen, restart flow
    — depends on: Health System, Death & Respawn

---

## Recommended Design Order

| Order | System | Priority | Layer | Agent(s) | Est. Effort |
|-------|--------|----------|-------|----------|-------------|
| 1 | Input System | MVP | Foundation | game-designer, godot-specialist | S |
| 2 | Health System | MVP | Foundation | game-designer, systems-designer | S |
| 3 | Room State System | MVP | Foundation | game-designer, godot-specialist | S |
| 4 | Player Controller | MVP | Core | gameplay-programmer, godot-gdscript-specialist | M |
| 5 | Hit Detection | MVP | Core | gameplay-programmer, godot-gdscript-specialist | S |
| 6 | Wire-Zip Traversal ⚠️ | MVP | Feature | gameplay-programmer, godot-gdscript-specialist | L |
| 7 | Shock Touch Combat | MVP | Feature | gameplay-programmer, systems-designer | M |
| 8 | Enemy AI (Basic) | MVP | Feature | ai-programmer, game-designer | M |
| 9 | Fuse Box Restoration | MVP | Feature | gameplay-programmer, game-designer | S |
| 10 | Visual Transformation | MVP | Presentation | technical-artist, godot-shader-specialist | M |
| 11 | Camera System | VS | Core | gameplay-programmer | S |
| 12 | Death & Respawn | VS | Feature | gameplay-programmer, game-designer | S |
| 13 | Area Unlock Progression | VS | Feature | game-designer, gameplay-programmer | S |
| 14 | Audio Manager | VS | Presentation | sound-designer, godot-specialist | S |
| 15 | HUD | Demo | UI | ui-programmer, ux-designer | S |
| 16 | Main Menu / Game Over | Demo | UI | ui-programmer | S |

*Effort: S = 1 design session, M = 2-3 sessions, L = 4+ sessions*

---

## Circular Dependencies

None found. The dependency graph is a clean DAG (directed acyclic graph).

---

## High-Risk Systems

| System | Risk Type | Risk Description | Mitigation |
|--------|-----------|-----------------|------------|
| Wire-Zip Traversal | Technical | Attaching to and sliding along wires smoothly in Godot 2D is unproven. Could require custom physics, raycasting, or path-following that's complex for a beginner. | **Prototype BEFORE designing any Feature-layer system.** Run `/prototype wire-zip-traversal` first. If it can't feel good, the whole concept changes. |
| Visual Transformation | Design + Art | The "lights-on" moment is the emotional core of Pillar 2. If it looks cheap or generic, it fails its purpose. High art quality bar for a beginner. | Use Godot's PointLight2D + particles to fake the effect early. Don't invest in custom shaders until prototype is validated. |
| Enemy AI (Basic) | Scope | "Basic" AI can balloon. "Detect player" + "react to shock" sounds simple but involves state machines, navigation, and edge cases. | Strictly limit scope: 2 states only (patrol / stunned). No pathfinding — enemies patrol on a fixed path. |

---

## Progress Tracker

| Metric | Count |
|--------|-------|
| Total systems identified | 16 |
| Design docs started | 0 |
| Design docs reviewed | 0 |
| Design docs approved | 0 |
| MVP systems designed | 0 / 10 |
| Vertical Slice systems designed | 0 / 4 |
| Demo systems designed | 0 / 2 |

---

## Next Steps

- [ ] Run `/prototype wire-zip-traversal` — validate the core mechanic before designing Feature-layer systems
- [ ] Design MVP Foundation systems first: `/design-system input-system`, `/design-system health-system`, `/design-system room-state-system`
- [ ] Run `/design-review` on each completed GDD
- [ ] Run `/gate-check pre-production` when all MVP systems are designed
- [ ] Plan first implementation sprint with `/sprint-plan new`
