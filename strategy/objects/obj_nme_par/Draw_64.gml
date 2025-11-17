///@desc
event_inherited();

draw_self();
if(stats[0]<stats[1]){
	draw_healthbar(bbox_left,bbox_bottom,bbox_right,bbox_bottom+5,(stats[0]/stats[1])*100,c_black,c_red,c_lime,0,true,false);
}