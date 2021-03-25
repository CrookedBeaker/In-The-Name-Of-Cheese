/// @description Make invisible to start

image_alpha = 0;

//Grey out of no file
if !file_exists("MainHallSave.save") && ind = 1 {sprite_index = spr_button_greyed}