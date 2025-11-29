# 🌏 Overview of the world
## **1. What the World Is**

AnotherLands takes place in a **post-collapse, dystopian fantasy world** where:

- Technology exists but is fragmented and barely understood.
- Magic exists but is unreliable, inconsistent, or partially lost.
- Most civilizations have retreated into isolated **Towns**, protected by ancient barriers or local forces.
- Everything outside those safe places is considered the **Unsafe Zone** — constantly shifting, hostile, and unpredictable.

The result is a world that feels **half-rebuilt, half-ruined**, with remnants of old tech (MitTech systems, forgotten drones, incomplete machines) scattered alongside magical anomalies and mutated wildlife.

---

## **2. World Structure**

The world is built from two major components:

### **Towns (Safe Areas)**

- Fixed by seed; layout doesn’t refresh between runs.
- Each town has shops, crafting facilities, storage, and unique NPC clusters.
- Towns act as checkpoints, hubs, and rest areas.
- Towns are placed far apart, giving a rhythm of -safe → dangerous → safe again- gameplay.

### **Unsafe Zones (Danger Areas)**

- Procedurally generated each time the player enters.
- Contain enemies, loot, activities, resource nodes, dungeons, anomalies, and doorways to deeper zones.
- Explore → fight → extract loop.

This creates the core gameplay cycle:
**Town → Unsafe Zone → Return to Town → Upgrade → Repeat**

Here’s a clean way to integrate **world grid sizes** directly into your *World Overview*, placed in the correct section (#2 World Structure) without breaking tone or flow.

You can paste this entire block under **2. World Structure**, right after “The world is built from two major components:” or at the end of that section.

---

## 🌐 **World Grid Size** *(add under Section 2)*

Although players experience the world organically, the underlying structure is built on a **linear world grid**.
Each “cell” in the grid represents one **Town** interval.

World sizes define how many towns exist in the generation:

| World Size      | Grid (town slots) | Notes                                         |
| --------------- | ----------------- | --------------------------------------------- |
| **Small**       | 9                 | Compact world with short travel loops         |
| **Medium**      | 13                | Balanced exploration and progression          |
| **Large**       | 17                | Long-distance expeditions, more biomes        |
| **Extra Large** | 21                | Massive world, ideal for long-term characters |

* **Explanation:** Grid = total town positions including the two ocean edges.
* Travel, difficulty, and pacing scale with the distance between towns along this 1D grid.

### How the Grid Works

- Most grid cells become **Unsafe Zones**.
- A smaller number are fixed as **Towns** (based on seed).
- The rest are connected with **Door Chains**, creating structured travel paths.
- Oceans or large obstacles may take up entire rows/columns, giving natural shaping to world geography.

### How the Grid Affects Gameplay

Players **can view the grid** through their MitTech Glove’s mapping interface, but the map reveals only:

* **Visited towns**
* **Explored unsafe zones**
* **Paths and door chains** discovered so far
* **Biomes** of previously visited areas

Areas not yet explored appear as **fogged, blank, or unstable zones** (fits the shifting-world lore).

The grid influences:

* Travel routes and distance
* How many towns exist in the world
* Difficulty scaling based on grid distance
* Overall exploration pacing

This turns the world map into a **strategic planning tool**, not just a visual reference.

---

## **3. Biome Logic**

Unsafe zones follow a broad biome archetype system:

- Ruined cities
- Industrial wastelands
- Post-tech forests
- Caves & underground networks
- Snowfields or frost areas
- Desert ruins
- Arcane anomalies

Each biome affects:

- Enemy types
- Resource spawns
- Loot quality
- Activities available
- Door difficulty

Biomes are lightweight narrative anchors for exploration depth.

---

## **4. Progression Through the World**

Players push deeper into the world through:

- **Door chains** connecting zones.
- **Increasing difficulty** the further they go from towns.
- **Loot tiers** scaling with danger level.
- **Activities** (mini-events) that reward high-risk decision making.

The loop encourages:

- Short safe runs for materials
- Long dangerous expeditions for rare loot
- Town upgrades to prepare for deeper zones

---

## **5. Environmental Philosophy**

The world is designed around an idea of **“reclaimed chaos”**:

- Towns look functional but improvised.
- Unsafe zones feel alive, moving, shifting — almost reacting to the player.
- Ancient tech blends with magical residue.
- Relics from before the Collapse show up in fragments.

Instead of being fully futuristic or fully fantasy, AnotherLands sits exactly in the hybrid space:
**“Magic that behaves like technology, and technology that behaves like magic.”**

---

## **6. Zone Identity Across the World**

Each unsafe zone has identity through:

- Local dangers
- Small stories embedded in environment
- Ruined structures that hint at old civilization
- Hidden chests, mineral nodes, or abandoned machines
- Audio/visual cues that differentiate danger tiers

This gives every run a memory:

- “The overgrown factory where the drones awakened.”
- “The sunken district full of corrupted plants.”
- “The frost ruins where the mage cult left their marks.”

---

## **7. Town Identity Across the World**

While towns share core structures:

- Armor shop
- Weapon shop
- Crafting stations
- Storage house
- Inn or rest area

Each town has distinct:

- NPC personalities
- Cultural decorations
- Faction influence
- Small local stories
- Crafting specialties (some towns excel in certain resources)

---

## **8. Global Themes**

The world reinforces these overarching ideas:

- **Humanity is rebuilding** from a technological collapse.
- **Magic and tech are intertwined** — neither fully understood.
- **Knowledge is fragmented**; relics hint at how things -used- to work.
- **Exploration is a necessity**, not a hobby — towns depend on scavengers.
- **Player’s Smart Glove** is key to interacting with the world, remnants of forgotten MitTech systems.

---

## **9. Why Unsafe Zones Shift**

Unsafe zones are unstable because:

- Environmental anomalies
- Tech ruins reactivating
- Magical contamination
- Unreliable memory of the pre-collapse grid system

This justifies procedural generation in-universe.

---

## **10. How the Player Fits Into the World**

The player is a **Scavenger**, equipped with an early-era MitTech Smart Glove prototype.
This glove:

- Provides inventory, map, and crafting access.
- Links to old tech scattered across the world.
- Drives progression and unlocks new systems.

Their role:
**Push into the shifting world → retrieve resources → strengthen towns → reveal forgotten truth.**