/// @description Load in the stuff from the last room!

if global.loading {// && global.loadingRoom != room {
	QuickLoad();
}
global.loading = false;
instance_destroy();