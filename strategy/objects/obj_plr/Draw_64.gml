///@desc selected character display
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
		draw_sprite(spr_portrait_frame,global.frameStyle,0,dH*.938);
		//portrait
		
		other.canMove=true;
		for(var i=0;i<array_length(actions);i++){
			var Y=(dH*.605)-(sprite_get_height(spr_action_card)*i);
			var acAl=0.5;
			//individual values
			if(mouse_x>0&&mouse_x<sprite_get_width(spr_action_card)){
				if(mouse_y>Y&&mouse_y<Y+sprite_get_height(spr_action_card)){
					acAl=1;
					other.canMove=false;
					
					if(mouse_check_button_pressed(mb_left)){
						other.qAction=actions[i];
					}//use action
				}
			}
			//hovering over an action card highlights it
			
			draw_sprite_ext(spr_action_card,actions[i],0,Y,1,1,0,c_white,acAl);
			draw_sprite_ext(spr_action_card_frames,global.frameStyle,0,Y,1,1,0,c_white,acAl);
		}//action cards
	}
}

//draw_text(mouse_x,mouse_y-20,qAction);