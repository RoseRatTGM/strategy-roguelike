/// @desc show hitboxes (debug)
if(!surface_exists(surf)){
	surf=surface_create(display_get_gui_width(),display_get_gui_height());
}//make sure there is a surface to draw to
draw_surface(surf,0,0);
//draw surf

#region debug mode
if(debug){
	with(all){
		draw_set_color(c_red);
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
	}//draw hitboxes
	
	draw_set_color(c_white);
	for(var i=0;i<rW/tS;i++;){
		draw_line(i*tS,0,i*tS,rH);
	}//vertical grid lines (showing horizontal spacing)
	for(var i=0;i<rH/tS;i++;){
		draw_line(0,i*tS,rW,i*tS);
	}//horizontal grid lines (showing vertical spacing)
	//draw grid lines
	
	draw_set_alpha(.1);
	mp_grid_draw(global.mpGrid);
	draw_set_alpha(1);
	//show mp grid
}
#endregion