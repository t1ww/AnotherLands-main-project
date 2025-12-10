/// @description > placeholder for player's spawn point

if !instance_exists(obj_player) {exit;}
if(spawn_id == cont_game.spawn_id){
	var _p = obj_player.__.character.instance ?? null;
	if(_p != null) _p.set_pos(x,y);
}
// clear instances
instance_destroy();