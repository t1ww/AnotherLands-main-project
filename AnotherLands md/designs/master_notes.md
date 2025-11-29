# Project’s vision: Another Lands (Outdated)
# Developer: t3ww

This master notes are initial designs of the game, please refer to the **[markdown plans](<../markdown_plans.md>)** and other files for more in-details and expanded ideas.

# 1. Overview
    Another Lands is a 2D loot-based RPG set in a `post-dystopian` fantasy world where advanced technology is rare and limited to the wealthy. The majority of people rely on recycling scraps and adapting to survive. Magic exists *but* is largely overshadowed by technology due to it's unstability.

The game combines elements of procedural generation, progression-based gameplay, and flexible class mechanics, drawing inspiration from games like Terraria, Roguelands, and Magicite.
As well as having immersive mage’s spell tinkering inspired by Noita.

# 2. World Design & Generation
    The world is structured as a fixed grid, with towns placed based on seeds and unsafe areas generated dynamically.

<br>

    Towns serve as hubs for storage, crafting, medical facilities, refineries, cooking, potion brewing, and shopping.

<br>

`Exploration zones (unsafe areas)` exist between towns and are randomly generated with each visit. Players can choose different difficulty levels for these zones.
The left and right world edges are oceans, with possible future expansions.
Room templates are used in unsafe areas, with paths blocked/unblocked dynamically based on environmental changes (e.g., a dried-out river revealing a path).

`Town & Unsafe Area Travel System`
When exiting a town, players can choose between left or right exits. This determines:
The destination town is based on a map grid.
The variant of the unsafe area (left- or right-oriented room templates).

`Unsafe Areas & Door Progression`
 Unsafe areas present 3–4 doors at the end, depending on the player’s current run progression:

`First 3 unsafe areas after leaving town:`
- Feature 3 doors (50% chance otherwise 4 doors):
    - First door: 70% chance to be the same tier, 30% to be one tier higher.
    - Second & third doors: always one tier higher.

`After 3 unsafe areas :`
- Feature 4 doors (100% chance):
    - First door: 70% chance to be the same tier, 30% to be one tier higher.
    - Second & third doors: always one tier higher.
    - Fourth door: always leads to the next town in destination.


# 3. Gameplay & Mechanics
`Class System`

Players can freely swap between class-based weapons, armors and accessories, similar to Terraria.

# ⚔️ Melee Class (Mobility & Survivability)
- Focuses on dodging, parrying, and movement.
- Uses grappling hooks and movement tools for repositioning.
- Combo-based combat, rewarding chaining attacks together.
- Light weapons = speed; heavy weapons = stagger & armor penetration.
#### Updated Melee Class (Mobility & Survivability)
- Focuses on dodging, parrying, and movement rather than raw defense.
- Grappling Hooks & Tools: Used for repositioning and environmental utility.
- Combo-Based Combat: Certain attacks chain into others for efficiency.
- Weapon Variety: Light weapons for speed, heavy weapons for stagger & armor penetration.
## Directional Parry System:
- Players parry by pointing the mouse toward the incoming attack’s direction.
- 6-direction system: 3 directions for attacks coming from the left, 3 for attacks from the right.
- Flying/Top attacks: Can be blocked using top-left or top-right parry directions.
- Bottom/under attacks: Cannot be parried; players must dodge or jump.
- Rewards skillful reading of attack patterns and being patient rather than simple timing.

# 🏹 Ranger Class (Precision & Power)
- High-damage, skill-based class with no aim assist but slightly larger hitboxes for balance.
- Recoil mechanics for added difficulty and skill expression.
## Magazine/Quiver System:
- Different ammo types (fire, poison, armor-piercing, etc.).
- Weapons provide synergies with certain ammo (e.g., snipers boost armor-piercing).
- Reloading system balances high-damage options.
## Ranger spraying
- `Core idea:` Some ppl may dislike the weapon shooting directly at cursor, and wanted to just long range spray from further, what if we allow that.
- `Main point:` Within the range from mouse to player the bullet will not hit anything, and from after the mouse on, the bullets may hit, and also bullets would travel with raycast rather than projectile so it has better chance of hitting. *by Mouse: I meant the precision cursor.
- `Yes:` Shotguns will have bigger precision cursor.
- `Maybe:` Scatter ammo for normal guns like rifles, which makes it basically like shotguns.

# 🪄 Mage Class (Versatility & Control)
A skilled mage can maintain infinite mana, rewarding precision.
## Mana Regeneration Mechanic:
- Casting spells creates mana stars at impact points.
- Collecting stars grants stacking mana regeneration buffs.

# 🍖 Tamer Class (All-rounder but hard to progress)
Can basically do everything but requires a lot of effort to collect them all.
- `Minion Focus:` Combat effectiveness depends entirely on summoned creatures.
- Slow Start, Strongest Late Game: Requires investment in minions to reach full potential.
- Some summons are Rideable for mobility.
- Summons that can be upgraded by gearing them up such as armor or special attachment like booster and steel claws.

## Taming System:
- Implement bleedout system for every enemy so that enemy at an amount value of hp(let’s say 1%) will get unconscious and will bleed until death unless healed. *Excessive healing make get them up and back into fight.*
Also tamers' minions will avoid attacking entity in bleedout state.
- Requires effort and following tasks to tame new creatures.
- `Minion Customization:` Different minions provide unique abilities, allowing for tailored builds. Also there may be cosmetics customization.
- Familiar bond, by keep doing actions like taming to the familiar will grows the bond more and more granting both familiar and player some buffs or unlocking new moves for the familiar, player may choose

### Familiar Personality System:
Each familiar could have a unique personality trait that influences its behavior, interactions with the player, and the world around them.
These traits can evolve as the bond between the player and the familiar strengthens, adding depth to the gameplay experience.

`Example: Greed`
A familiar with the "Greed" personality trait would have an insatiable desire for shiny objects, food, or valuable resources. It might
"steal" items from the player or NPCs, triggering humorous or problematic
interactions. NPCs might react with annoyance or amusement, and the familiar's actions could impact quests, such as
requiring the player to retrieve stolen items or dealing with consequences like NPCs refusing to trade. The familiar could also get certain buffs when it successfully collects items, making it a valuable but mischievous
companion.

# 4. Companion & Utility Features
## Companion Drones
- They are assistive drones that help with tedious tasks.
- These drones function similarly to Roguelands, providing utility and general assistants.
- The companion drone is initially dormant and only activates when the player equips the smart glove.
- Players will be able to upgrade for more tasks for them to do, and possibly ability to assist in combat.
- Players will be able to unlock different models of them for cosmetics purposes.

### Drone Mechanic Overview:

1. `Initial Bonding Phase:` The player begins with a drone that adapts to their actions, learning and developing a unique personality based on player behavior. The drone offers personalized dialogue and reactions, creating a strong emotional connection.
2. `Switch Mechanic:` At a pivotal point in the story, players have the option to switch to a new, upgraded drone. This switch is tied to significant plot events, such as the original drone’s sacrifice or damage.
3. `Consequences of Switching:` While the new drone offers specialized abilities, it lacks the depth and personality of the original, leading to a sense of loss for players. The dialogue is more robotic and generic, emphasizing the trade-off between efficiency and emotional connection.
4. `Emotional Impact:` This mechanic encourages players to reflect on the value of companionship, highlighting themes of friendship, sacrifice, and the costs of progress. Players may experience nostalgia for their original drone, creating memorable storytelling moments.

## Smart Glove (thematic detail)
`Acts as the player’s main UI hub:`
- Inventory, messages, quests, map access.
- Attachable utility functions, such as an item magnet.
- Accessory slot system, similar to Terraria.

# 5. Inventory System & UI
Inspired by Terraria, with mouse interactions with quick-stack and sorting buttons to manage items.
Side-to-side Stats comparison system for convenience.
Mark them favourite to avoid unintentional bad moves like quick stack and trashing loved items.

# 6. Event listener
An event listener system allows dynamic assignment, triggering, and unassigning of events.
Currently no clear plans on what to do with it, but it’d be mainly used for world events and town events. Affecting the NPCs behaviors.

# 7. AI NPC Systems
- There are Persistent NPCs and Temporarily NPCs 
    - Persistent NPCs are procedurally generated with the world and remain persistent.
    - Persistent NPCs have memorable interactions with the player and may travel to different locations.
    - Persistent NPCs are random but have some fixed conditions to avoid predictability.
    - Temporarily NPCs are randomly generated to fill up the scenery, player’s should be able to seamlessly distinguish them from the persistent ones by design.

# 8. Economy & Resources
The game will use a single currency system for simplicity and accessibility.
Economy balance will focus on fair progression without overcomplication.
We’ll be using lesser numbers for easier counting such as an apple is $1 rather than $10 in some games.

# 9. Audio & Visual Design
Pixel-art aesthetic with potential for enhanced lighting effects.
Has not yet explored audio design.

# 10. Development Plans
### Immediate Goals
- Refine inventory system (finalizing interactions).
- Crafting system with towns generation templates.
- World explorations with wildland templates.
### Long-Term Goals
- Develop multiplayer features once the core gameplay loop is complete.
- Potentially expand ocean edges for extra late-game content.
- Polish NPC generation & persistence system.
- Expand town features & interactions.
### Optional Goals
- Make unforgettable beautiful scenery designs.
- Implement a quest system with well-written, rewarding content.
- Sand-box content area.

# 11. Extra ideas

## Inventory System Idea

- Each town has storage units that connect directly to the player’s inventory, allowing items to be safely stored between runs.
- Items carried during exploration runs may be dropped unless secured in storage.
- Potential upgrades include:
  - **Protected Slots:** Prevent certain inventory slots from dropping items.
  - **Expanded Stack Sizes:** Increase the maximum quantity of items per slot.
  - **Additional Inventory Slots:** Provide more room for collected items.

## Crafting System Update:
  Crafting will draw inspiration from *Minecraft-style speed crafting*, using custom irregular grids. The intended item’s outline will appear faintly on the grid as a reference.
  Players use their `hotbar (1–9 bindable slots)` and can quickly swap materials between mouse and hotbar with keybinds. An additional 9 inventory slots are reserved for crafting materials.

  Complex items require `sequential crafting` — players must first craft individual components from raw materials before assembling the final product.

  The `quality result` depends on crafting speed, with each quality tier applying a multiplier to the item’s base stats.

### Quality Tiers:

  - Bad — ×0.75
  - Normal — ×1.00
  - Perfect — ×1.25
  - Unreal — ×1.50

*There may also be leaderboard for it*

*Crafting may include procedures of crafting each component of the item before putting them together.*

## Activities idea
1.	Fishing 	
2.	Alchemy 	
3.	Treasure Hunting 	
4.	Arena Battles 	
5.	Archery Range 	
6.	Racing 	
7.	Crafting Workshops 	
8.	Musical Performances 	
9.	Gardening 	
10.	Board Games

# Events idea (from chatgpt)
Here are some ideas and examples of how you could implement various events and activities:

`In-Game Events and Festivals`

## Daily Events:

`Shops and Businesses:` NPCs open and close their shops at specific times. For example, a blacksmith might be available from 9 AM to 5 PM.

`NPC Routines:` NPCs could have daily schedules, such as visiting the market in the morning, working during the day, and relaxing at a tavern in the evening.

## Weekly Events:

`Market Day:` Every Saturday, a special market appears in the town square with unique items and vendors.

`Tournaments:` Weekly competitions, such as fishing contests, shooting ranges, or cooking contests.

## Seasonal Events:

`Spring Festival:` Celebrate the beginning of spring with flower planting, egg hunts, and special quests.

`Summer Fair:` Activities like fishing competitions, barbecues, and outdoor concerts.

`Autumn Harvest Festival:` Harvest-related mini-games, cooking contests, and craft fairs.

`Winter Festival:` Ice skating, snowball fights, and festive decorations.

## Annual Festivals:

`New Year Celebration:` Fireworks, special quests, and time-limited rewards.

`Halloween Event:` Spooky quests, costumes, and themed mini-games.

`Christmas Event:` Gift-giving quests, holiday decorations, and festive music.

## Implementation Ideas

### Event Triggers:

- Use your existing date and time system to trigger events. For example, on the first day of spring, start the Spring Festival.

Implement a function that checks the current date and triggers events accordingly.

## Activities and Mini-Games:

`Flower Planting:` For the Spring Festival, players could participate in a mini-game to plant and water flowers.

`Fishing Contest:` During the Summer Fair, have a fishing mini-game where players compete for the biggest catch.

`Snowball Fight:` For the Winter Festival, include a snowball fight mini-game where players can compete against NPCs or other players.

### Rewards and Incentives:

*Offer unique items, achievements, or currency for participating in events.*

Special event-only items that can be used to decorate the player's hub or improve their character.

### Visual and Audio Elements:

`Decorations:` Change the appearance of towns and environments based on the season or event.

`Music:` Play special event-themed music during festivals.

`NPC Behavior:` NPCs can have different dialogues and actions during events, enhancing the festive atmosphere.

# Example Festival Design

## Winter Festival Example:

`Date:` December 20th to December 31st

## Activities:

`Ice Skating:` Set up an ice rink where players can skate and perform tricks.

`Snowball Fight:` Players can engage in a snowball fight mini-game.

`Gift Exchange:` NPCs give and receive gifts, with the player participating in a gift-giving quest.

`Special Quests:` Quests related to finding and decorating a Christmas tree, or helping NPCs prepare for the festival.

## Rewards:

`Unique Decorations:` Christmas lights, snowmen, and other festive items.

`Special Equipment:` Winter-themed clothing or gear.

`Achievements:` Unlockable achievements for participating in and winning various activities.

---

## Personal Library

A hub where the player collects books, notes, and other informational items. It organizes content into categories for easy access, keeping the inventory uncluttered. The library also integrates progression-based tracking, giving players insight into what they’ve discovered and what remains unknown.

**Key Features:**

- **Content Collection:** Books, notes, scrolls, and other collectible documents.
- **Categorization:** Automatically sorted into categories for easier navigation.
- **Progression Tracking:** Unlocks entries as the player discovers creatures, recipes, or lore.
- **Spoiler Awareness:** Warnings when showing content that hasn’t been discovered yet.
- **Integration with Tamer Gameplay:** Reveals creature stats and health bars when unlocked, helping tamers avoid killing tamed or target creatures.

--- 

## Class Facilities
Each town contains specialized facilities supporting each class path.
These locations act as hubs for training, progression, and class-related activities.

### Mage Tower (Mage)
A tall arcane structure filled with scrolls, notes, and magical instruments.

- Area for studying spells and runes
- Space for controlled spell practice
- Research-focused environment for arcane refinement

### Mage’s Library (Mage)
A quiet, knowledge-rich archive maintained by scholars, scribes, and retired mages.

- Large collection of rune studies, spell theory, and arcane history
- Contains grimoires, fragmented scrolls, and rare magical texts
- A place to decode riddles, study gesture diagrams, and uncover hidden spell variants
- Provides research bonuses when crafting spells in the Mage Tower
- Some shelves require arcane clearance or puzzle-solving to access deeper secrets

### Hunter Lodge (Ranger)
A rustic lodge with an attached archery range and tracking grounds.

- Area for preparing and maintaining ranged gear
- Space for crafting specialized ammunition
- Grounds for practicing accuracy and tracking

### Combat Arena (Melee)
A fortified yard built for physical training and sparring.

- Space for practicing strikes, dodges, and parries
- Equipment for strength and agility drills
- Trials for advanced melee progression

### Tamer’s Grounds (Tamer)
A peaceful sanctuary dedicated to familiar care and bonding.

- Area for resting, feeding, and nurturing familiars
- Space for handling and obedience training
- Facilities for advanced growth and evolution tasks

---

# Filler Towns
Filler towns are small, functional stops designed to give players a brief respite between wildlands, without being full hubs. They provide essential services and minor interactions, keeping the game flow smooth.

## Minimum Essentials

- **Basic Healing:** An NPC, healing station, or safe bed. Not full recovery—just enough to continue exploring.
- **Small Merchant:** Sells basic supplies such as potions, ammo, repair kits, and emergency food.
- **Rest Zone:** Bed, bench, or safe area where buffs recover and debuffs wear off.
- **Exit Gate:** Clear path to return to surrounding wildlands.

## Optional Extras

- **Random Event:** A traveling NPC offering a mini-game, gear repair, or small trade.
- **Mini-Quest Giver:** Short side tasks like “Find my lost bag nearby” to add engagement.
- **Environmental Flavor:** Decorative elements like campfires, tiny gardens, or broken buildings for atmosphere.

## Summary

Filler towns = heal a bit + stock a bit + continue. They act as tiny oases, keeping players moving without serving as a major hub.