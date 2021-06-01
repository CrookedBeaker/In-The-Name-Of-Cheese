/// @description End an attack

if (attacking && (sprite_index = spr_player_body_stab || sprite_index = spr_player_body_cast || sprite_index = spr_player_body_whip)) || sprite_index = spr_player_body_shoot {
	sprite_index = spr_player_body;
	attacking = false;
}