/// @description Extra stuff
//PP ASS

//draw_set_alpha(1-0.5*(pDist>256))

//UI Flare
draw_sprite(spr_ui_corners,0,0,0);
draw_sprite(spr_ui_corners,1,480,0);

//Mouse UI
var mouseIsInTheWay = instance_exists(obj_player) ? (mouse_x > (x+160) && mouse_y > (y+64)) || (obj_player.x > (x+160) && obj_player.y > (y+64)) : 0;
draw_set_alpha(1-0.5*mouseIsInTheWay);

draw_sprite(spr_ui_corners,2,480,384);

//Display Spell
var mpCost = "--";
if global.spells[0] {
	switch global.spellSelect {
		case 0:
			mpCost = "2";
			break;
		case 1:
			mpCost = "3";
			break;
		case 2:
			mpCost = "2";
			break;
		case 3:
			mpCost = "5";
			break;
		case 4:
			mpCost = "10";
			break;
	}
	
	draw_sprite(spr_spells,global.spellSelect,595,397);
}
draw_set_font(fnt_ui_small);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(608,434,mpCost+"MP");
draw_text(513,434,string(global.pATK)+"ATK");

draw_set_font(fnt_ui);

//Main UI
var c_hp = make_color_rgb(178,16,48);
var c_mp = make_color_rgb(56,55,188);
var c_exp = make_color_rgb(86,179,192);

var stringHP = (global.pHP<10) ? "0"+string(global.pHP) : string(global.pHP);
stringHP += (global.pHPMax<10) ? "/0"+string(global.pHPMax) : "/"+string(global.pHPMax);

var stringMP = (global.pMP<10) ? "0"+string(global.pMP) : string(global.pMP);
stringMP += (global.pMPMax<10) ? "/0"+string(global.pMPMax) : "/"+string(global.pMPMax);

if global.pEXP < 10 {
	var stringEXP = "00"+string(global.pEXP);
} else if global.pEXP < 100 {
	var stringEXP = "0"+string(global.pEXP);
} else {
	var stringEXP = string(global.pEXP);
}

if global.pLVL < 10 {
	stringEXP += (global.pEXPMax<100) ? "/0"+string(global.pEXPMax) : "/"+string(global.pEXPMax);
} else {
	stringEXP += "/MAX"
}

var mouseIsInTheWay = instance_exists(obj_player) ? (mouse_x < (x-144) && mouse_y > (y+64)) || (obj_player.x < (x-144) && obj_player.y > (y+64)) : 0;

draw_set_halign(fa_left);
draw_set_font(fnt_ui);
draw_set_alpha(1-0.5*mouseIsInTheWay)

draw_sprite(spr_ui_main,0,0,480);

draw_set_color(c_hp);
draw_text(98,373,stringHP);

draw_set_color(c_mp);
draw_text(98,390,stringMP);

draw_set_halign(fa_right);
draw_set_color(c_exp);
draw_text(166,407,stringEXP);

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(77,352,"Level "+string(global.pLVL));

//Heathbars
draw_healthbar(25,375,94,386,(global.pHP/global.pHPMax)*100,c_black,c_hp,c_hp,0,false,false);
draw_healthbar(25,392,94,402,(global.pMP/global.pMPMax)*100,c_black,c_mp,c_mp,0,false,false);

//Spells!
if global.spells[0] {
	draw_sprite(spr_spells,0,8,444);
	draw_sprite(spr_ui_select,0,6+31*global.spellSelect,442);
}
if global.spells[1] {draw_sprite(spr_spells,1,39,444)};
if global.spells[2] {draw_sprite(spr_spells,2,70,444)};
if global.spells[3] {draw_sprite(spr_spells,3,101,444)};
if global.spells[4] {draw_sprite(spr_spells,4,132,444)};

draw_set_alpha(1);

/*
//Testing
draw_set_halign(fa_left);
draw_set_font(fnt_ui);
draw_text(0,0,string(instance_number(obj_e_guard_body)));