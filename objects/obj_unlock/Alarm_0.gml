/// @description Close.

if (!global.muteMusic) {audio_resume_all()};
instance_destroy();

global.pause = false;
global.pauseDisable = false;

obj_camera.stop = false;