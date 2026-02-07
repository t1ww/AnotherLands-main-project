// Script to initialize player's get input functions
function _scr_player_inputs() {
    return {
        init: function(_p) {
            _p.get_input_h = function() {
                var l = cont_input.check_hold(vk_left, ord("A"));
                var r = cont_input.check_hold(vk_right, ord("D"));
                return r - l;
            };

            _p.get_input_v = function() {
                var k = vk_space;
                return {
                    pressed: cont_input.check_pressed(k),
                    check:   cont_input.check_hold(k)
                };
            };

            _p.get_input_sprint = function() {
                var k = vk_lshift;
                return {
                    pressed: cont_input.check_pressed(k),
                    check:   cont_input.check_hold(k),
                    release: cont_input.check_released(k)
                };
            };

            _p.get_input_dash = function() {
                return cont_input.check_pressed(ord("C"));
            };

            _p.get_any_input = function() {
                var v = _p.get_input_v();
                var s = _p.get_input_sprint();
                return _p.get_input_h() != 0
                    || v.pressed || v.check
                    || s.pressed || s.check || s.release
                    || _p.get_input_dash();
            };
        }
    };
}
