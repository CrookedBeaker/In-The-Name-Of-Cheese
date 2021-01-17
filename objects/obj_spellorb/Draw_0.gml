/// @description Show the spell
draw_set_alpha(image_alpha);

draw_sprite_stretched(spr_spells,spellID,x-12.5*image_xscale,y-15*image_yscale,25*image_xscale,30*image_yscale);
draw_self();

draw_set_alpha(1);