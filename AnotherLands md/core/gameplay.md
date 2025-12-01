# Extracted Gameplay Content From Master Note

*(This is the raw design content we currently have for gameplay.md)*

---

## 1. Core Gameplay Loop

* Town → Unsafe Area → Door Progression → Next Town
* Player prepares in town: crafting, rest, storage, upgrades.
* Enters unsafe area: randomized layout, enemies, loot.
* Clears until doors appear.
* Chooses door → determines next unsafe area or next town.
* Progression resets when returning to town.

---

## 2. Class System (Core Gameplay Feature)

Players freely swap weapons/armors/accessories between classes, similar to Terraria.
Each class functions as a “playstyle package” rather than a locked character class.

### ⚔️ Melee Class – Mobility & Survivability

* Emphasis on dodging, parrying, fast movement.
* Grappling hooks and movement tools for repositioning.
* Combo-based attack chains.
* Light weapons = speed.
* Heavy weapons = stagger + armor penetration.

#### Directional Parry System

* Mouse-direction parry with 6 parry angles (3 left, 3 right).
* High/low attack recognition.
* Top-left/top-right for airborne attacks.
* Bottom attacks can’t be parried — must dodge.
* Encourages pattern reading over timing spam.

---

### 🏹 Ranger Class – Precision & Power

* High-damage class with no aim assist but larger hitboxes.
* Recoil system for skill expression.

#### Magazine / Quiver System

* Different ammo types: fire, poison, AP, etc.
* Weapons give synergy (e.g., snipers boost AP ammo).
* Reloading as balancing mechanic.

#### Ranger Spraying

* Optional “spray mode” for players who dislike aim-at-cursor.
* Bullets ignore collision until beyond the cursor.
* Hit detection uses raycast for consistency.
* Shotguns have larger precision cursor.
* Potential scatter ammo for rifles → shotgun-like patterns.

---

### 🪄 Mage Class – Versatility & Control

* A skilled mage can maintain infinite mana through technique.

#### Mana Regeneration Mechanic

* Spells create mana stars at impact points.
* Collecting stars increases mana regen stacks.
* Rewards precision and spell accuracy.

---

### 🍖 Tamer Class – All-Rounder Late-Game Power

* Slow start, strongest late game.
* Depends on minions for all actions.

#### Minion Progression

* Rideable minions for mobility.
* Minions can equip armor and special attachments (claws, boosters).
* Advanced customization for abilities & cosmetics.

#### Taming System

* Every enemy has a bleedout threshold (e.g., 1% HP).
* Bleedout creatures collapse and slowly die unless healed.

  * Excessive healing wakes them up → returns to fight.
* Minions avoid attacking bleedout targets.
* Requires tasks/rituals to tame.
* Familiar bond bonuses unlock new abilities and buffs.

#### Familiar Personality System

* Each familiar has a personality that affects behavior.
* Personality evolves with bond.
* Example: **Greed**

  * Likes stealing shiny items.
  * NPCs react differently.
  * Can affect quests or trader behavior.
  * Gains buffs when collecting items.

---

## 3. Companion & Utility Gameplay

### Companion Drones

* Assistive drones helping with utility tasks.
* Starts dormant → activates when player gets the Smart Glove.
* Upgradeable to handle more tasks or light combat.
* Different cosmetic drone models.

#### Drone Emotional Gameplay

1. Learns from player behavior, forms unique personality.
2. Story event forces a switch to an upgraded drone.
3. New drone is stronger but “soulless” compared to original.
4. Creates emotional impact around progress vs companionship.

---

### Smart Glove System

* Player’s main UI hub (inventory, quests, messages, map).
* Supports attachable utilities (e.g., item magnet).
* Has accessory slots.

---

## 4. Inventory & UI Gameplay

* Terraria-inspired inventory system.
* Mouse interactions, quick-stack, sorting.
* Stat comparison side-by-side.
* Favorites to prevent accidental trashing/stacking.
* Some inventory slots protected via upgrades.
* Stack size upgrades.
* Runs drop items unless stored in town.

---

## 5. Event Listener Gameplay

* Dynamic world events and town events.
* Affects NPC behavior.
* Assign/unassign event scripts at runtime.

---

## 6. NPC Gameplay

* Persistent NPCs generated with world; keep memories/interactions.
* They can travel between towns.
* Semi-random but constrained personality generation.
* Temporary NPCs fill scenery and are visually distinct.

---

## 7. Economy Gameplay

* Single currency.
* Small number scaling (apple = $1).
* Focus on simple progression-friendly economy.

---

## 8. Activities (Gameplay-Side Systems)

* Fishing
* Alchemy
* Treasure hunting
* Arena battles
* Archery range
* Racing
* Crafting workshops
* Musical performances
* Gardening
* Board games

---

## 9. Filler Town Gameplay

* Acts as small rest-stop between wildlands.

### Essential Features

* Minor healing.
* Merchant with basic stocks.
* Safe rest zone.
* Exit back to wildlands.

### Optional

* Traveling NPC with mini-game.
* Micro-quests (“Find my bag”).
* Environmental flavor.