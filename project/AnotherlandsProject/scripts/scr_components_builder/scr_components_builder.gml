// File that handles and ensure usage of component and import system
function import(_object_index) {
    if(!instance_exists(_object_index)) {
        instance_create_depth(0,0,0,_object_index);
    }
    return _object_index;
}