// File that combine and create all builders at once. ensuring they're in the global.import
function _scr_scripts_builder(){
    global[$ "import"] ??= {};
    _player_scripts_build();
}