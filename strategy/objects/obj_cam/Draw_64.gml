/// @desc menu, cursor, fps
#region menu
draw_set_halign(fa_center);
var col=c_white;
var mScale=1.5; //menu scale
var fn=font_add_sprite(spr_font,32,true,1);
draw_set_font(fn);

if(paused){
	draw_sprite_ext(spr_menu,room==rm_main,0,0,1,1,0,c_white,1);
	//background
	
	switch(room){
		default:
			draw_set_color(col);
			draw_text_transformed(display_get_gui_width()*.5,display_get_gui_height()*.05,"Paused",mScale,mScale,0);
		break; //Paused text at top
	}
	
	for(var i=0;i<array_length(pMArr[pMInd]);i++){
		var X=display_get_gui_width()*.5;
		var Y=(display_get_gui_height()*.45)+(i*10*mScale);
		//menu position
		var fSize=font_get_size(fn); //size of font
		var sSize=string_width(pMArr[pMInd,i])*.5*mScale; //width of line text
		//menu entry size
		var mHeight=Y+(fSize*.5);
		//point of y axis around which mouse is registered
		if(abs(device_mouse_x_to_gui(0)-X)<=sSize&&abs(device_mouse_y_to_gui(0)-mHeight)<(fSize*((8-mScale)/10))){
			sInd=i; //hovering over entries selects them
			process_menu(mouse_check_button_pressed(mb_left)); //clicking an entry interacts with it
		}//mouse support
		
		col=c_white;
		if(sInd==i){
			col=c_black;
			draw_rectangle_color(X-((sSize)*mScale),Y-(mScale*1.5),X+(sSize*mScale),(Y-2)+(fSize*mScale*.8),c_white,c_white,c_white,c_white,false);
		}//selected entry
		//draw selected menu item in a box
		
		if(i<=array_length(pMArr[pMInd])-1){ //seems redundant, but keeps from crashing when moving between sub menus with different lengths
			draw_text_transformed_color(X,Y,pMArr[pMInd,i],mScale,mScale,0,col,col,col,col,1);
		}//draw menu
	}
}

font_delete(fn);
#endregion

draw_sprite_ext(spr_cursor,0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),1,1,0,c_white,1);
//cursor

if(debug){
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_text(8,0,"FPS: "+string(game_get_speed(gamespeed_fps)));
}//fps