///@desc selection (debug)
if(instance_position(mouse_x,mouse_y,self)&&mouse_check_button_pressed(mb_right)){
	if(obj_plr.target==self){
		obj_plr.target=noone;
	}
	else{
		obj_plr.target=self;
	}
}