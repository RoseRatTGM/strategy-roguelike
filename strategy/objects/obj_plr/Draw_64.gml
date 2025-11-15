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
						switch(other.qAction){
							default:
								other.qAction=actions[i];
							break;
							case actions[i]:
								other.qAction=-1;
							break;
						}
					}//set action to be used
				}
			}
			//hovering over an action card highlights it
			
			if(other.qAction==actions[i]){
				acAl=1;
			}//selected action remains highlighted
			
			draw_sprite_ext(spr_action_card,actions[i],0,Y,1,1,0,c_white,acAl);
			draw_sprite_ext(spr_action_card_frames,global.frameStyle,0,Y,1,1,0,c_white,acAl);
		}//action cards
	}
	
	if(qAction>-1&&target==noone){
		var fn=font_add_sprite(spr_font,32,true,1);
		draw_set_font(fn);
		//set custom font
		draw_set_color(c_black);
		draw_rectangle(dW,0,dW*.75,string_height_ext(global.actions[qAction,3],-1,125)*2,false);
		//background box
		draw_set_color(c_white);
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
		//text alignment
		draw_text(dW*.99,dH*.01,global.actions[qAction,2]);
		draw_text_ext_transformed(dW*.99,dH*.15,$"{global.actions[qAction,3]}",-1,125,.5,.5,0);
		//action name and description
		font_delete(fn);
	}
}

//draw_text(mouse_x,mouse_y-20,qAction);