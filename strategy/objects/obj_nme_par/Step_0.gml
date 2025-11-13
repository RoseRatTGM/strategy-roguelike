///@desc 
if(instance_position(mouse_x,mouse_y,self)&&mouse_check_button_pressed(mb_right)&&obj_plr.selected!=noone){
	obj_plr.target=self;
}