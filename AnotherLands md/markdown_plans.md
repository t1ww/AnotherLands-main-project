## 🧭 How to Know Where an Idea Belongs

When sorting new design ideas, use this table as a guide — it’s like a mental “router” for your notes.

| **Type of Idea**               | **Ask Yourself**                                                         | **Where It Belongs**                                             |
| ------------------------------ | ------------------------------------------------------------------------ | ---------------------------------------------------------------- |
| **Core gameplay**              | “Does this affect how the player plays the game second-to-second?”       | `core/` (e.g. combat, classes, movement, interactions, crafting) |
| **World logic**                | “Does this define the world’s layout, geography, or systemic rules?”     | `world/` (e.g. towns, unsafe zones, generation)                  |
| **Lore and narrative**         | “Does this describe the history, beliefs, and meaning behind the world?” | `lore/` (e.g. myths, factions, timeline, ancient tech)           |
| **Systemic mechanics**         | “Is this a background system that supports multiple gameplay parts?”     | `system/` (e.g. AI, economy, event system, drone glove)          |
| **Meta / game structure**      | “Does this describe the player’s long-term journey, unlocks, or pacing?” | `core/progression.md` or `designs/roadmap.md`                    |
| **Experimental or vague idea** | “Do I not know where this fits yet?”                                     | `designs/sandbox.md` (temporary parking lot)                     |

---

### Example Workflow

If you’re unsure — drop it in the **sandbox** first with a short header tag.

```
### [System: Crafting NPCs]
Idea: NPCs learn by observing the player’s crafting process once. They gain recipe familiarity and can replicate basic results.
```

Later, once you notice a theme or system forming, migrate all `[System: Crafting NPCs]` notes into `system/crafting.md`.

---

## 🗂️ Suggested Markdown Structure (Final)

Your current folder structure now reflects this clean categorization:

```
AnotherLands-project
│   README.md
│   .gitattributes
│
└── AnotherLands md
    ├── core/
    │   ├── gameplay.md          # Controls, combat flow, stamina/mana, parry, interactions
    │   ├── classes.md           # Overview of all player archetypes
    │   ├── progression.md       # Unlocks, skill/item growth, tiers
    │   └── classes/
    │       ├── melee.md
    │       ├── ranger.md
    │       ├── mage.md
    │       └── tamer.md
    │
    ├── system/
    │   ├── crafting.md
    │   ├── economy.md
    │   ├── drone_glove.md       # Smart glove hub + drone companion systems
    │   ├── events.md
    │   └── npcs.md
    │
    ├── world/
    │   ├── overview.md
    │   ├── generation.md
    │   ├── towns.md
    │   └── unsafe_zones.md
    │
    ├── lore/
    │   ├── timeline.md          # Collapse and pre-collapse events
    │   ├── factions.md          # Cults, guilds, town orders
    │   ├── mythology.md         # Relics, gods, myths, world beliefs
    │   ├── festival.md          # Local culture and annual events
    │   └── technology.md        # Ancient tech, glove origin, lost knowledge
    │
    ├── content/
    │   ├── activities.md
    │   ├── enemies.md
    │   ├── loot_items.md
    │   └── quests_events.md
    │
    └── designs/
        ├── sandbox.md           # Unsorted or new ideas
        ├── dev_diary.md         # Development notes, insights, logs
        └── scrapped_ideas.md
```

---

## 🧩 Optional: Idea Tagging System

To future-proof your notes, tag each entry with small references.

Example:

```
**Tags:** #system #crafting #npc #progression
```

If you later migrate to **Obsidian**, **Notion**, or a custom search script, these tags automatically create searchable connections between related concepts (e.g., all crafting-related systems or NPC behavior notes).