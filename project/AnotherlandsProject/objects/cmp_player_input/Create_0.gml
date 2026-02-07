// cmp_player_input
persistent = true; // Component stay alive
visible = false; // Component stay hidden

// horizontal movement
get_h = function() {
    var l = cont_input.check_hold(vk_left, ord("A"));
    var r = cont_input.check_hold(vk_right, ord("D"));
    return r - l;
};

// vertical / jump
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
