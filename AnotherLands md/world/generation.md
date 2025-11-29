# 🌐 World Generation

    The world follows a [fixed-grid structure], combining predictable town placement with dynamically generated unsafe zones. This ensures a balance between consistency, exploration, and replayability.

---

## 1. World Structure

### Fixed Grid Layout

- The world is arranged along a **horizontal grid**.
- **Towns** occupy fixed grid nodes determined by the world seed.
- **Unsafe areas (exploration zones)** occupy the spaces *between- towns does not get fixed by seed but instead is influenced by the previous -> next towns.
- The **leftmost** and **rightmost** edges of the world end in **oceans**, reserving space for possible expansions.

### Towns

Towns act as stable hubs. Each town provides services such as:

- Storage, crafting, medical stations
- Refineries, cooking, potion brewing
- Shops and class facilities

Players return to towns frequently to progress, rest, or prepare for further exploration.

---

## 2. Unsafe Areas (Exploration Zones)

Unsafe areas —also called *wildlands*— are the primary procedural component of the world.

### Key Characteristics

- **Regenerated each visit**
    Wildlands reset whenever the player re-enters, ensuring variety.

- **Room Templates**
    Procedural generation uses modular room templates.
    Environmental changes (ex: dried rivers, collapsed tunnels) may **open or close** paths dynamically.
    - Orientations When leaving a town:
        - **Left exit → left-oriented unsafe area templates**
        - **Right exit → right-oriented unsafe area templates**

*Orientation affects room layouts, hazards, and traversal flow.*

- **Tier based on the towns**
    Current and target towns influenced the tier of map templates player will possiby rolled for.

- **Difficulty selectable**
    Players pick an extra difficulty adjustment before entering. This will be similar to roguelands but with more effort. Such as new enemies, new resources, new environmental danger, etc.


---

## 3. Travel System (Town ↔ Unsafe Areas)

When exiting a town, players choose **Left** or **Right**.
This determines:

1. **Destination Direction** (which town the player is travelling toward)
2. **The unsafe area's template orientation** (left/right variant)

Each unsafe area acts as one “step” toward the next town on the grid.

---

## 4. Door Progression System

At the end of every unsafe area, the player is presented with **3–4 doors**.
These doors determine the next unsafe area’s **tier** or whether the player progresses to the next town.

### First 3 Unsafe Areas After Leaving a Town
- **3 doors** (50% chance for 4)

### Door rules:
- **Door 1:**
    - 60% → same tier
    - 30% → +1 tier
- **Doors 2 & 3:** 
    - always +1 tier
- **Door 4:** 
    - always → **Next Town**

### After 3 Unsafe Areas without reaching the towns
- **Always 4 doors**

### Door rules:
- **Door 1:**
    - 60% → same tier
    - 30% → +1 tier
- **Doors 2 & 3:** 
    - always +1 tier
- **Door 4:** 
    - always → **Next Town**

*It's currently the same but I keep it separate in-case there's an idea for changes.*

`This system keeps early areas predictable while enabling meaningful branching and difficulty scaling later.`

---

## 5. Room Template System

Unsafe areas are composed of **template chunks**, each with:

- Layout variations
- Procedural hazards
- Environmental states
- Possible resource nodes
- Random encounters / wildlife

### Dynamic Pathing

Templates may change based on:

- Weather conditions
- Time of day
- Persistent events
- Environmental state (e.g., river dries up → unlocks new route)

---

## 6. Oceans (World Edges)

The world’s far ends are **coastal regions**:

- Act as natural boundaries
- Potential future updates include:
    - There should be towns
    - Island expansions
    - Fishing or naval content
    - Another dimension's boss
    - Under the seas' update
    - Pirate shipping update

---

## Summary

The generation system blends **fixed structure** with **high replay variety**:

- **Towns:** constant, predictable hubs
- **Unsafe Areas:** fully procedural each run
- **Door System:** controlled randomness guiding player progression
- **Grid Layout:** simple global structure, endless local variation

Together, these systems support a world that feels alive, replayable, and exploration-driven.