///@description switch focus to new obj

var followPrev = follow;

follow = followNext; //New focus!
followNext = followPrev; //Set up to return to previous focus