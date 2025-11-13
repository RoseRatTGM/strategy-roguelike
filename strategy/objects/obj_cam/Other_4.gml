/// @desc reset surface/camera
snapToPlayer=true;
if(surface_exists(surf)){
	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
}//reset surface