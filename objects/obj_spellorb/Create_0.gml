/// @description Remove if claimed, not loading, gun mode

if (global.spells[spellID] && spellID != 0) {instance_destroy()};

if global.gunMode { //Replace with an elixir in gun mode
	instance_destroy();
	instance_create_depth(x,y,depth,obj_elixir);
}