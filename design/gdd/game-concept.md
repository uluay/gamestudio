# Game Concept: Live Wire

*Created: 2026-03-26*
*Status: Draft*

---

## Elevator Pitch

> A panda electrician zips through dark, broken apartments using electrical
> wires as traversal — shocking enemies with melee contact, reaching fuse boxes,
> and watching a dead building come to life one room at a time.
>
> It's a 2D Metroidvania-lite platformer where you FIX and FIGHT using the same
> electric power, in a painterly world that transforms visually as you restore it.

---

## Core Identity

| Aspect | Detail |
| ---- | ---- |
| **Genre** | 2D Platformer / Metroidvania-lite |
| **Platform** | PC (Windows/Linux) — primary; Web (itch.io) — secondary |
| **Target Audience** | Mid-core platformer fans, 10–30, Ori/Celeste/Hollow Knight players |
| **Player Count** | Single-player |
| **Session Length** | 20–30 minutes (demo), 5–10 minute play cycles |
| **Monetization** | Free demo |
| **Estimated Scope** | Small — demo: 1 floor, 5 apartments, 1 boss room |
| **Comparable Titles** | Ori and the Will of the Wisps, Celeste, Hollow Knight |

---

## Core Fantasy

You are a panda electrician with supernatural mastery of electricity.
You don't fix things carefully — you **zip**, **shock**, and **restore** with
style. Dark apartments tremble as you swing between live wires and punch enemies
into walls. When you reach the fuse box and flip it, the whole room floods with
warm light and the world wakes up around you.

The fantasy: *bringing a broken world back to life through movement and power.*

---

## Unique Hook

> "It's like *Ori and the Will of the Wisps*, AND ALSO every wire in the
> environment is a tool you can grab, zip along, and use to electrocute enemies."

The environment is not just a backdrop — it is the traversal system. Wires are
rails. Fuse boxes are goals. The building itself is the puzzle, and electricity
is the solution.

---

## Player Experience Analysis (MDA Framework)

### Target Aesthetics (What the player FEELS)

| Aesthetic | Priority | How We Deliver It |
| ---- | ---- | ---- |
| **Sensation** (sensory pleasure) | 1 | Wire-zip feel, shock feedback, visual transformation on fix |
| **Discovery** (exploration, secrets) | 2 | Dark rooms hide paths; fixing circuits reveals new areas |
| **Fantasy** (make-believe, role-playing) | 3 | Panda electrician identity; world-restoration arc |
| **Challenge** (obstacle course, mastery) | 4 | Enemy placement, wire routing, apartment layout puzzles |
| **Narrative** (drama, story arc) | 5 | Implied story: who broke the power? What lives here? |
| **Expression** | N/A | Not a focus for demo |
| **Fellowship** | N/A | Single-player |
| **Submission** | N/A | Not a relaxation game |

### Key Dynamics (Emergent player behaviors)

- Players will scan rooms for wire paths before jumping in
- Players will use wire-zip to dodge enemies rather than fighting everything
- Players will backtrack to newly lit apartments to find secrets
- Players will feel rewarded completing each fuse box — small, satisfying victories

### Core Mechanics (Systems we build)

1. **Wire-Zip Traversal** — grab live wires and slingshot/slide along them;
   primary movement verb; wires are placed to make rooms traversable
2. **Shock Touch Combat** — charge up and physically contact enemies to stun/
   electrocute them; one melee hit; no projectiles
3. **Fuse Box Restoration** — reach the fuse box in each apartment to trigger
   a visual transformation (dark → lit); unlocks a door, platform, or passage
4. **Area Unlock Progression** — restored circuits power blocked paths
   (elevator, locked door, powered platform), enabling Metroidvania-style flow

---

## Player Motivation Profile

### Primary Psychological Needs Served

| Need | How This Game Satisfies It | Strength |
| ---- | ---- | ---- |
| **Autonomy** | Choose wire paths, choose when to fight vs. avoid enemies | Supporting |
| **Competence** | Each fixed apartment is a clear win; movement mastery grows | Core |
| **Relatedness** | Panda character personality; implied residents whose lives improve | Supporting |

### Player Type Appeal (Bartle Taxonomy)

- [x] **Achievers** — clear goals per room (reach fuse box), apartment completion, floor cleared
- [x] **Explorers** — dark rooms hide secrets; fixed circuits reveal new areas
- [ ] **Socializers** — not applicable (single-player)
- [ ] **Killers/Competitors** — not a focus

### Flow State Design

- **Onboarding curve**: Tutorial apartment with 1-2 wires and 1 enemy. No text walls.
  The panda grabs the first wire instinctively because it glows.
- **Difficulty scaling**: Early apartments — clear wire paths, few enemies.
  Later apartments — longer wire routes, more enemies blocking the path.
- **Feedback clarity**: Wire-zip has visual + audio juice. Shock touch has screen shake +
  electric particle burst. Fuse box triggers a room-wide "lights on" moment.
- **Recovery from failure**: Respawn at apartment entrance. Enemies reset.
  Death is low-stakes — it's a demo about feel, not punishment.

---

## Core Loop

### Moment-to-Moment (30 seconds)

Enter a dark room → spot glowing wires → zip to navigate → encounter an enemy →
shock touch to defeat → continue toward the fuse box.

This loop must feel good in isolation. Wire-zip should feel like swinging.
Shock touch should feel like a satisfying punch. Neither requires the other to
be fun.

### Short-Term (5-15 minutes)

Clear 1 apartment (2-4 rooms) → reach fuse box → lights on → visual
transformation → new path opens. "One more apartment" is the equivalent of
"one more turn."

### Session-Level (20-30 minutes — Demo)

Work through 5 apartments on one building floor. Each restored apartment
powers a new section. The 5th apartment powers the floor's main elevator →
access the boss room → defeat the saboteur → floor fully restored → demo ends
on a beautiful lit building reveal.

### Long-Term Progression

*Demo scope only — no long-term loop needed. Future vision:*
Multiple floors with unique visual themes (flooded basement, rooftop garden,
server room). Ability unlocks (longer zip range, shock area burst) tied to
key boss defeats.

### Retention Hooks

- **Curiosity**: Every dark corridor hides either a secret or an enemy. Players
  want to know what's in the next apartment.
- **Investment**: Visual state of the building reflects progress — the restored
  section glows warmly vs. the dark unfinished section.
- **Mastery**: Wire routing gets more creative in later apartments.

---

## Game Pillars

### Pillar 1: Electrifying Movement
Every room must be traversable and interesting using the wire-zip system.
If a room requires a different movement verb to be fun, redesign the wiring.

*Design test*: "Should we add a jump pad here?" → No. Design the wire layout
to create the same traversal opportunity instead.

### Pillar 2: World Transformation
Fixing a circuit must visibly, beautifully change the environment.
Players should feel like they are bringing a dead world to life.

*Design test*: "Should we add a cutscene for the boss?" → Only if it shows
the building transforming. The transformation IS the story.

### Pillar 3: Simple but Tactile
One traversal verb (zip). One combat verb (shock). Depth comes from how
rooms combine these verbs, not from adding new mechanics.

*Design test*: "Should we add a ranged attack?" → No. A second combat verb
violates this pillar. Stay physical, stay tactile.

### Anti-Pillars (What This Game Is NOT)

- **NOT a bullet-hell**: Combat is physical contact and positional play, not
  projectile dodging. Adding ranged enemies should be minimal and late-game.
- **NOT an open world**: Linear apartment-to-apartment progression protects
  demo scope and beginner dev workload.
- **NOT a puzzle game**: The fuse box is a destination reached through
  movement skill, not a brain-teaser. Keep it Mario-feel.
- **NOT a story-heavy game**: The world tells its story through environment
  and transformation, not cutscenes or dialogue.

---

## Inspiration and References

| Reference | What We Take From It | What We Do Differently | Why It Matters |
| ---- | ---- | ---- | ---- |
| *Ori and the Will of the Wisps* | Painterly visual style, world-transformation feel, atmospheric lighting | Apartments instead of forests; industrial/domestic aesthetic | Proves painterly 2D + transformation feel resonates with players |
| *Celeste* | Tight movement feel, each screen as a self-contained challenge, death is fast | Wire-zip instead of dash; Metroidvania structure instead of linear levels | Proves tight platformer movement can carry a whole game |
| *Hollow Knight* | Metroidvania structure, dark-to-revealed world, tactile melee | Lighter tone (panda comedy), shorter scope, no stamina system | Proves connected map + melee feel works for solo dev |
| *Untitled Goose Game* | Comedy through character identity in domestic setting | Less chaos, more mastery; electricity replaces honking | Proves absurd character premise can carry a game commercially |

**Non-game inspirations**:
- Studio Ghibli's domestic magic (*Totoro*, *Kiki's Delivery Service*) — the
  warmth of ordinary spaces made extraordinary
- Neon signs and warm tungsten lighting in urban photography — the aesthetic
  of electricity as beauty, not just utility

---

## Target Player Profile

| Attribute | Detail |
| ---- | ---- |
| **Age range** | 12–30 |
| **Gaming experience** | Mid-core — plays 3-5 hours/week, familiar with platformers |
| **Time availability** | 20-minute sessions, demo playable in one sitting |
| **Platform preference** | PC or web browser |
| **Current games they play** | Ori, Celeste, Hollow Knight, A Short Hike |
| **What they're looking for** | A beautiful, satisfying platformer with a unique character and world |
| **What would turn them away** | Punishing difficulty, confusing controls, ugly or generic art |

---

## Technical Considerations

| Consideration | Assessment |
| ---- | ---- |
| **Recommended Engine** | Godot 4.6 — excellent 2D physics, CharacterBody2D for tight platformer feel, free, strong community for solo beginners |
| **Key Technical Challenges** | Wire-zip system (raycast or path-following along Line2D), shock touch hitbox timing, room state persistence (lit/dark) |
| **Art Style** | 2D painterly — Ori-inspired warm/cool contrast, soft glowing particles. **Risk**: high art complexity for solo beginner. Strategy: start with placeholder art, use Godot particles to fake painterly glow |
| **Art Pipeline Complexity** | Medium — use asset packs for prototype, custom art later if time allows |
| **Audio Needs** | Moderate — wire-zip whoosh, electric crackle SFX, ambient dark/ambient lit music states |
| **Networking** | None |
| **Content Volume** | Demo: 5 apartments (~15 rooms), 1 boss room, 1 floor |
| **Procedural Systems** | None — hand-crafted apartments for demo |

---

## Risks and Open Questions

### Design Risks

- **Wire-zip may not feel fun**: If grabbing wires feels floaty or imprecise,
  the entire game falls apart. This must be prototyped first, before any art or
  level design.
- **Metroidvania scope creep**: Even "lite" Metroidvania structure can balloon.
  Strictly limit connections — 5 linear apartments, not a web.

### Technical Risks

- **Wire interaction system**: Detecting which wire the player is near, attaching,
  sliding along it smoothly — requires solid Godot physics work. Unknown for
  a beginner.
- **Room state persistence**: Dark → lit rooms need to stay lit if the player
  revisits. Requires simple persistent state system.

### Market Risks

- **Art quality gap**: Ori-style art is a high bar. If the game looks generic,
  the visual promise of the concept is broken.
- **Demo is too short**: ~20 minutes may not generate enough engagement for
  wishlists. Mitigate with high polish on the transformation moment.

### Scope Risks

- **Art is the biggest risk for solo beginner**: Keep placeholder art until
  gameplay is proven. Do NOT polish art before the wire-zip system feels great.
- **Feature creep**: Second combat verb, inventory, dialogue — all cut.

### Open Questions

- **Q: Does wire-zip feel good?** → Answer with a 2-apartment Godot prototype.
  Test before building anything else.
- **Q: Is shock touch satisfying without more visual feedback?** → Test with
  placeholder: big screen shake + particle burst. Tune from there.
- **Q: How many wires per room feels right?** → Prototype 3 layouts: sparse
  (2 wires), medium (4 wires), dense (6+ wires). Pick the one that feels best.

---

## MVP Definition

**Core hypothesis**: *"Zipping along wires and shock-touching enemies in a
small apartment room is intrinsically fun for 5–10 minutes without any
progression, story, or polish."*

**Required for MVP**:
1. Wire-zip traversal (grab + slide along Line2D wires)
2. Shock touch combat (melee hitbox + screen shake + particles)
3. One complete apartment (3 rooms + fuse box)
4. Fuse box "lights on" moment (dark → lit transition)

**Explicitly NOT in MVP** (defer to later):
- Painterly art — use colored rectangles and placeholder sprites
- Music — silence or placeholder loop
- Multiple apartments — one is enough to test the loop
- Enemy variety — one enemy type only
- Any progression system

### Scope Tiers (if budget/time shrinks)

| Tier | Content | Features | Notes |
| ---- | ---- | ---- | ---- |
| **MVP** | 1 apartment (3 rooms) | Wire-zip + shock touch + fuse box | Proves core loop |
| **Vertical Slice** | 2–3 apartments | Core loop + lights-on transformation + 1 secret | Shareable prototype |
| **Demo** | 5 apartments + boss room | Full loop + progression + basic art + audio | Publishable on itch.io |
| **Full Vision** | Multi-floor building | Multiple enemies, ability unlocks, full painterly art, story | Post-demo if concept validates |

---

## Next Steps

- [ ] Get concept approval — share with a friend or post on Discord for quick gut-check
- [ ] Run `/setup-engine godot 4.6` to configure engine in CLAUDE.md and populate Godot reference docs
- [ ] Run `/design-review design/gdd/game-concept.md` to validate completeness
- [ ] Run `/map-systems` to decompose concept into individual systems with dependencies
- [ ] **Prototype wire-zip first** — run `/prototype wire-zip-traversal` before anything else
- [ ] Validate with `/playtest-report` after prototype
- [ ] Plan first sprint with `/sprint-plan new`
