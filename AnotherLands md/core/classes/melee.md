# Spear — Stab / Poke Mechanics

## 1. Inputs / State Machine
- **On mouse down (click) — Stab**  
  - Executes a single quick thrust animation and applies `stabDamage`.  
  - If the button remains held, transitions to **Poke** state.
- **While mouse held — Poke**  
  - Spear stays extended, no damage unless current speed ≥ `pokeSpeedThreshold`.  
  - Damage scales with movement speed.
- **On mouse release — Exit Poke**  
  - Retracts spear to neutral state.

---

## 2. Tuning Variables
- `baseDamage` — base weapon damage  
- `stabBaseMultiplier` — base multiplier for stab  
- `pokeBaseMultiplier` — base multiplier for poke  
- `speedThreshold` — minimum speed to activate poke  
- `stabSpeedScaleFactor` — stab speed scaling  
- `pokeSpeedScaleFactor` — poke speed scaling  

Example defaults:  

stabBaseMultiplier = 1.0
pokeBaseMultiplier = 1.2
speedThreshold = 3.5
stabSpeedScaleFactor = 0.8
pokeSpeedScaleFactor = 0.5

---

## 3. Damage Formulas
Let `v` = player speed, `T` = `speedThreshold`, `BD` = `baseDamage`.

**Stab:**

stabDamage = BD × stabBaseMultiplier × (1 + (v / T) × stabSpeedScaleFactor)

**Poke (only if v ≥ T):**

pokeDamage = BD × pokeBaseMultiplier × (1 + ((v - T) / T) × pokeSpeedScaleFactor)

---

## 4. Gameplay Intent
- **Stab** is a reliable quick attack usable anytime.  
- **Poke** rewards high-speed momentum (sprinting, mounted attacks).  
- Both scale with movement speed for impactful, aggressive play.