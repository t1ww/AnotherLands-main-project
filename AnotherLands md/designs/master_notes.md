# Project’s vision: Another Lands
# Developer: t3ww

# 1. Overview
Another Lands is a 2D loot-based RPG set in a `post-dystopian` fantasy world where advanced technology is rare and limited to the wealthy. The majority of people rely on recycling scraps and adapting to survive. Magic exists *but* is largely overshadowed by technology due to it's unstability.

The game combines elements of procedural generation, progression-based gameplay, and flexible class mechanics, drawing inspiration from games like Terraria, Roguelands, and Magicite.
As well as having immersive mage’s spell tinkering inspired by Noita.

# 2. World Design & Generation
The world is structured as a fixed grid, with towns placed based on seeds and unsafe areas generated dynamically.

Towns serve as hubs for storage, crafting, medical facilities, refineries, cooking, potion brewing, and shopping.

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
- Requires effort and following tasks to tame new creatures.
- Failing to tame has consequences? (potential hostility, lost resources, etc.).
- `Minion Customization:` Different minions provide unique abilities, allowing for tailored builds. 

# 4. Companion & Utility Features
## Companion Drones
They are assistive drones that help with tedious tasks.
These drones function similarly to Roguelands, providing utility and general assistants.
The companion drone is initially dormant and only activates when the player equips the smart glove.

Will be able to upgrade for more tasks for them to do, and possibly ability to assist in combat.
Players will be able to unlock different models of them for cosmetics purposes.

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
Immediate Goals
Refine inventory system (finalizing interactions).
Crafting system with towns generation templates.
World explorations with wildland templates.
Long-Term Goals
Develop multiplayer features once the core gameplay loop is complete.
Potentially expand ocean edges for extra late-game content.
Polish NPC generation & persistence system.
Expand town features & interactions.
Optional Goals
Make unforgettable beautiful scenery designs.
Implement a quest system with well-written, rewarding content.
Sand-box content area.

# 11. Extra ideas
- Inventories idea: so in the way it saved is that in each towns there’s storage, and these storage are able to connect to inventory, thus saving items, so the items during the run will drop; ideas is that we might let player upgrades inventory slots that makes that slot not drop item, i can also give bigger stack size, etc

- Progression guide built-in to the one of the ui’s hub page, showing list of things players could get, categorized, just like how wiki would be. Which are shown based on what’s available for the player currently based on area visited and resources in inventory.

- Crafting can be detailed like crafting blades at smithing shop and user have to actually learn to get good at it in it’s minigame, when they get good quality for good amount of times, the npc will level up in certain skill set, such as crafting perfect sword blades often will let npc learns to make better blades for all things like axes and knives too.

- Crafting may include procedures of crafting each component of the item before putting them together.

By chat
Here’s a refined project design format suggestion, based on professional game design docs, tailored for solo/indie workflow like yours.

Another Lands – Project Design Document
By: t3ww

1. Game Overview
Genre: 2D Procedural Loot-Based RPG
Themes: Dystopian Fantasy, Tech-Magic Hybrid
Inspiration: Terraria, Roguelands, Magicite, Noita
Hook: Freely swappable class mechanics + immersive spell system + persistent world-linked NPCs + meaningful exploration

2. World Structure
2.1 World Layout
Fixed grid of towns


Unsafe areas (exploration zones) are procedurally generated


Left/right world edges = oceans


Room templates define structure; dynamic path blocking/unblocking based on environment


2.2 Towns
Seed-based generation


Facilities: crafting, cooking, medical, refining, potion brewing, shops


Storage is town-specific but connects to player inventory during visits


Some towns have exclusive services or NPCs


2.3 Unsafe Areas & Travel
Randomly generated each run


Tier-based difficulty scaling


Travel determines zone direction (left/right rooms)


Door system:


First 3 areas: 3 doors (sometimes 4)


After 3 areas: 4 doors; last door leads to destination town



3. Core Gameplay & Progression
3.1 Class System (Flexible, Item-Based)
Players are not locked to a class — their gear determines their style.
Melee: Mobility, parrying, combo chains, light vs. heavy weapon depth


Ranger: Precision, recoil handling, ammo synergies (e.g., sniper + armor-piercing)


Mage: Noita-style spell system, mana regeneration loop via skill


Tamer: Minion-focused; slow start, late-game powerhouse; summons with gear & mounts


3.2 Combat Mechanics
Active dodging, movement, spell and resource management


Mini-boss triggers and tiered bosses for progression



4. Player Tools & Equipment
4.1 Smart Glove (Core UI Hub)
Inventory, map, quest logs


Upgrades: item magnet, utility tools


Hosts accessory slots (like Terraria)


4.2 Companion Drones
Activates with glove


Performs fetch, scan, assist tasks


Customizable and upgradable (combat, visuals, tools)


4.3 Utility Tools (future section)
Grappling hooks, scanners, gliders, terraforming tools


Exploration-enhancing, not focused on combat



5. Inventory & Crafting
5.1 Inventory System
Terraria-style UI with quick-stack, sorting, comparison


Town storage connects to inventory


Slot upgrades: prevent item drops, increase stack size


5.2 Crafting System (Planned)
Multi-step: component crafting before full item assembly


Skill-based minigames for blacksmithing, potion-making, etc.


NPCs level up their own crafting skills based on what you do


5.3 Built-in Progression Guide
Auto-populates based on player discoveries


Functions like a contextual in-game wiki



6. AI & NPCs
6.1 Persistent NPCs
Generated with the world


Travel between towns


Have set personalities, relationships, and progression flags


Some semi-scripted behaviors to maintain world immersion


6.2 Temporary NPCs
Fill town population for ambiance


Visually or behaviorally distinct from persistent NPCs



7. Economy & Resources
Single-currency system


Items have low values for easier math (e.g., apple = $1)


Economy scales with exploration tier


Resources gathered from unsafe zones, trades, and events



8. Event System
Event listener system (planned use: world/NPC behavior changes)


Could trigger NPC migrations, store changes, town events, world hazards



9. Visual & Audio
Simple pixel art with plans for enhanced lighting


Sound design TBD (may outsource or use libraries)



10. Development Roadmap
Current Focus
Inventory system polish


Town generation


Unsafe area room templates


Next Milestones
Basic crafting framework


NPC persistence system


Combat prototype


Future Goals
Multiplayer


Ocean/late-game expansions


Dynamic quests with long-term impact


Aesthetic & atmospheric content (e.g., magical forests)



11. Optional/Experimental Ideas
Special progression slots (never drop items)


Custom upgrade trees for summons


Tools that modify terrain temporarily (for puzzle or movement)


AI events causing town shifts or disasters


Quests that change how NPCs respond in future towns


Sandbox “relaxation” zone with aesthetic tools


12. Content ideas:

12.1 Enemies
Sky Piercer (Temp Name)
✔ Giant predatory bird that watches from the sky.
✔ Impact: Forces the player to keep moving or use cover—or risk being snatched and slammed into hard surfaces.
✔ Tells:
Eagle screech before dive <- or as a tell that it’s in the area.


Maybe small stones or dust kicked up when diving.

 ✔ Behavior:


Ignores player when under cover, like trees.


Targets players in open areas and standing still,


Will retreat after a failed grab attempt, resetting stalk.

 ✔ Possible loot:


Feathers (for glide upgrade?),


Beak scrap (for weapon mod?),


Rare: “Sky Talon Chip”—maybe unlocks air dash upgrade?

Extra idea
allows player to sell all unfavorited items in their possession, the idea is for like, player’s retirement, and they sell all and those money might just be enough to start a business in a town.
Summon taming ideas, implement bleedout system for every enemy so that enemy at an amount value of hp(let’s say 1%) will get unconscious and will bleed until death unless healed
so the summoner have to heal their wound to keep them alive while taming them
excessive healing may get them up and back into fight, with some chance of them fleeing or instantly tamed
summoners’ minions will avoid attacking entity in bleedout state
Name changes
Summoner -> tamer, minions -> familiar
Familiar bond, 
by keep doing actions like taming to the familiar will grows the bond more and more granting both familiar and player some buffs or unlocking new moves for the familiar, player may choose
Inventories idea: 
so in the way it saved is that in each towns there’s storage, and these storage are able to connect to inventory, thus saving items, so the items during the run will drop; ideas is that we might let player upgrades inventory slots that makes that slot not drop item, i can also give bigger stack size, etc
Drone Mechanic Overview: (maybe no)
1.    Initial Bonding Phase: The player begins with a drone that adapts to their actions, learning and developing a unique personality based on player behavior. The drone offers personalized dialogue and reactions, creating a strong emotional connection.
2.    Switch Mechanic: At a pivotal point in the story, players have the option to switch to a new, upgraded drone. This switch is tied to significant plot events, such as the original drone’s sacrifice or damage.
3.    Consequences of Switching: While the new drone offers specialized abilities, it lacks the depth and personality of the original, leading to a sense of loss for players. The dialogue is more robotic and generic, emphasizing the trade-off between efficiency and emotional connection.
4.    Emotional Impact: This mechanic encourages players to reflect on the value of companionship, highlighting themes of friendship, sacrifice, and the costs of progress. Players may experience nostalgia for their original drone, creating memorable storytelling moments.

Activities idea
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
