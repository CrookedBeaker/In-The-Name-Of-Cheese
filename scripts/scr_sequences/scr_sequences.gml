///Sequence-related functions

function IntroEnd(){
	room_goto(rm_title);
}

function IntroSkip(){
	Transition(rm_title,seq_fadeout,seq_fadein);
}

//Sewer End

function SEEnd(){
	Transition(rm_save,seq_fadeout,seq_fadein);
}