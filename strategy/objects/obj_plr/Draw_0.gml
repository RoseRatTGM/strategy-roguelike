///@desc movement range
if(selected!=noone){
	with(selected){
		if(targX!=x/tS||targY!=y/tS){
			draw_tile_color(targX,targY,c_lime);
			//when moving, target tile is highlighted
		}
		else{
			for(var i=0;i<rW/tS;i++){
				for(var j=0;j<rH/tS;j++){
					if(abs(targX-i)<=spd&&abs(targY-j)<=spd
					&&abs(targX-i)+abs(targY-j)<=spd*1.5){
						draw_tile_color(i,j,c_green,.3);
					}
				}
			}//draw full movement range
			
			var col=c_lime;
			if(!canMoveToSel){
				col=c_red;
			}
			draw_tile_color(floor(mouse_x/tS),floor(mouse_y/tS),col);
			//tile mouse is hovering over is highlighted
		}
		
		draw_sprite_ext(spr_floor_highlight,0,x,y,1,1,0,c_lime,1);
		//floor highlight
	}
}

if(target!=noone){
	with(target){
		draw_sprite_ext(spr_floor_highlight,0,x,y,1,1,0,c_red,1);
	}
}

//draw_text(mouse_x,mouse_y-20,floor(mouse_x/tS));