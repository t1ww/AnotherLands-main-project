/// @description Common instance-level OOP utility patterns
/// Ensure exactly one instance exists, return the survivor
function scr_ensure_singleton(_inst) {
    var _existing = instance_find(_inst.object_index, 0);
    if (_existing != _inst) {
        instance_destroy(_inst);
        return _existing;
    }
    return _inst;
}
/// Attach methods/data to an instance once
function scr_attach_once(_inst, _key, _attach_fn) {
    if (!variable_instance_exists(_inst, _key)) {
        _attach_fn(_inst);
        _inst[$ _key] = true;
    }
}
/// Lightweight mixin pattern
function scr_mixin(_inst, _struct) {
    var _keys = variable_struct_get_names(_struct);
    for (var i = 0; i < array_length(_keys); i++) {
        _inst[$ _keys[i]] = _struct[$ _keys[i]];
    }
}
