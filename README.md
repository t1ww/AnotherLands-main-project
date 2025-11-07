# AnotherLands-project

- *Reimagined of my biggest personal project, using better plannings after my SE study.*
---

### README.md

*(for: AnotherLands-project)*

---

# AnotherLands

    **Developer:** t3ww
    **Genre:** 2D Loot-Based RPG
    **Status:** In development
    **Engine:** GameMaker Studio 2

---

## 1. Project Vision

**AnotherLands** is a **2D loot-based RPG** set in a **dystopian fantasy world** where technology and magic coexist uneasily.
Advanced machines remain only in the hands of the privileged, while most survivors adapt with scraps, craftwork, and remnants of lost civilizations.

The game blends:

* **Procedural exploration** (towns fixed by seed, unsafe zones randomized)
* **Flexible class mechanics** (swappable gear defines combat style)
* **Persistent NPC world systems** (living economy, crafting memory, dynamic towns)
* **Immersive spell and item systems** (player mastery influences AI learning)

**Inspirations:** *Terraria, Roguelands, Magicite, Noita*
**Core Themes:** survival through creativity, legacy of craftsmanship, and the tension between forgotten magic and fading technology.

---

## 2. Gameplay Overview

Players travel between **town hubs** and **unsafe exploration zones** called **The Outerlands** in a looping progression system.
Each town provides crafting stations, quests, and NPCs that evolve through interaction.

**Core Features**

* Free class swapping (Melee, Ranger, Mage, Tamer)
* Glove-based UI hub (inventory, map, quests, drone upgrades)
* Skill-based crafting and combat
* Procedurally generated unsafe zones with event-driven layouts
* Persistent NPCs who learn from the player’s mastery

---

## 3. Current Focus

* Inventory and UI refinement
* Crafting minigame framework
* Town generation system
* Unsafe zone room templates and travel logic

**Next Milestones**

* NPC persistence and event system
* Combat and progression prototypes
* Drone and glove feature integration

---

## 4. Repository Structure

```
AnotherLands-project
│   README.md
│   .gitattributes
│
└── AnotherLands md
    ├── core/           → Player mechanics, classes, gameplay flow
    │   ├── classes.md
    │   ├── gameplay.md
    │   ├── progression.md
    │   └── classes/
    │       ├── melee.md
    │       ├── ranger.md
    │       ├── mage.md
    │       └── tamer.md
    │
    ├── system/         → Foundational systems (crafting, events, AI, economy)
    │   ├── crafting.md
    │   ├── drone_glove.md
    │   ├── economy.md
    │   ├── events.md
    │   └── npcs.md
    │
    ├── world/          → Geography, generation, town and zone structure
    │   ├── overview.md
    │   ├── generation.md
    │   ├── towns.md
    │   └── unsafe_zones.md
    │
    ├── lore/           → World history, mythos, and technological background
    │   ├── factions.md
    │   ├── festival.md
    │   ├── mythology.md
    │   ├── technology.md
    │   └── timeline.md
    │
    ├── content/        → Game content: loot, quests, activities, and enemies
    │   ├── activities.md
    │   ├── enemies.md
    │   ├── loot_items.md
    │   └── quests_events.md
    │
    └── designs/        → Active development space and documentation
        ├── dev_diary.md
        ├── sandbox.md
        └── scrapped_ideas.md
```

---

## 5. Development Philosophy

> “Refactor design like code.”

AnotherLands grows modularly — each `.md` file functions as a self-contained design module.
Systems and ideas can be revised or expanded without breaking the overall structure.
Unsorted or experimental notes go to **`designs/sandbox.md`**, then graduate into their appropriate section once refined.

**Principles**

* Keep gameplay systems interoperable (e.g., crafting ties into economy, AI, and town events).
* Favor depth over complexity.
* Document everything as if explaining to your future self.

---

## 6. Notes for Future Expansion

* **Multiplayer roadmap** after core systems stabilize
* **Ocean edge expansion** for late-game content
* **Atmospheric world layers:** festivals, relics, ecosystem cycles
* **AI-driven town evolution:** player decisions shift economy and culture

---

## 7. Contact / Attribution

Project maintained and developed by **t3ww**.
All assets, code, and designs are proprietary to the **AnotherLands** project.