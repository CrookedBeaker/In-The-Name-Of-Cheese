/// @description Remove if claimed, not loading, gun mode

if (global.spells[spellID] && spellID != 0) || global.gunMode {instance_destroy()};