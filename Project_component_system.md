# Component Import Pattern (Persistent Component Instances)

This project uses a **component-as-object** pattern instead of structs or scripts.

Each component is a **persistent GameMaker object** that exposes behavior through methods and is accessed via an explicit `import()` call to ensure **singleton-like access**.

---

## Core Idea

- Components are **objects**
- Each component:
  - Is **persistent** and **hidden**

  ```gml
    persistent = true; // Component stay alive
    visible = false; // Component stay hidden
  ```

  - Contains **only functions**
  - Holds **no others-specific state**

- Gameplay objects **import** components and call their methods
    - `import()` → component access

This avoids scope issues, supports autocomplete, and keeps logic centralized.

---

## Component Definition

### Example: `cmp_player_input`

```gml
// cmp_player_input
persistent = true; // Component stay alive
visible = false; // Component stay hidden

// horizontal movement
get_h = function() {
    var l = cont_input.check_hold(vk_left, ord("A"));
    var r = cont_input.check_hold(vk_right, ord("D"));
    return r - l;
};

// jump / vertical
get_v = function() {
    var k = vk_space;
    return {
        pressed: cont_input.check_pressed(k),
        check:   cont_input.check_hold(k)
    };
};

// sprint
get_sprint = function() {
    var k = vk_lshift;
    return {
        pressed: cont_input.check_pressed(k),
        check:   cont_input.check_hold(k),
        release: cont_input.check_released(k)
    };
};

// dash
get_dash = function() {
    return cont_input.check_pressed(ord("C"));
};

// any input
get_any = function() {
    var v = get_v();
    var s = get_sprint();

    return get_h() != 0
        || v.pressed || v.check
        || s.pressed || s.check || s.release
        || get_dash();
};
````

---

## Import System

### Global Import Helper

```gml
function import(_object_index) {
    if (!instance_exists(_object_index)) {
        instance_create_depth(0, 0, 0, _object_index);
    }
    return _object_index;
}
```

* Ensures **exactly one instance**
* Lazily creates the component
* Returns a stable reference

---

## Using a Component

### Player Create Event

```gml
player_input = import(cmp_player_input);
```

### Usage Anywhere

```gml
var h = player_input.get_h();
var v = player_input.get_v();

if (player_input.get_dash()) {
    // dash logic
}
```

---

## Why This Works Well

* No `other` / `with` ambiguity
* No struct lifetime issues
* Autocomplete works (object methods)
* One source of truth per system
* Easy to debug (real instances)
* Clean call sites (`player_input.get_h()`)

---

## Design Rules

* Components **must be stateless or read-only**
* Components expose behavior only

---

## Naming Convention

* `cmp_*` → component objects
* Variables named after purpose:
  * `player_input`
---

## Summary

This pattern treats components as **live service objects**:

* Created once
* Shared everywhere
* Called explicitly
* Always required by gameplay objects

It is simple, robust, and scales cleanly with project size.