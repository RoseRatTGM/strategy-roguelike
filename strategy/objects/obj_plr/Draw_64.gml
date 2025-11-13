///@desc 
var dW=display_get_gui_width();
var dH=display_get_gui_height();
//screen size

if(selected!=noone){
	with(selected){
		draw_set_color(c_black);
		draw_rectangle(0,dH,dW*.2,dH*.93,false);
		//background

		var fn=font_add_sprite(spr_font,32,true,1);
		draw_set_font(fn);
		//set font
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_set_color(c_white);
		draw_text(0,dH,identity);
		//text
		font_delete(fn);
		
		draw_sprite(spr_portrait_images,index,0,dH*.938);
		draw_sprite(spr_portrait_frame,1,0,dH*.938);
		//portrait
	}
}