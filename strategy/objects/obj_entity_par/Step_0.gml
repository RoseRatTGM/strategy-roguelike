///@desc movement
if((targX!=x/tS||targY!=y/tS)&&!path_exists(path)){
	sprite_index=sprites[1];
	x+=8;
	y+=8;
	
	path=path_add();
	if(mp_grid_path(global.mpGrid,path,x,y,(targX*tS)+8,(targY*tS)+8,false)){
		path_start(path,1,path_action_stop,0);
	}//create and start a movement path to the target
}
else{
	if(path_exists(path)){
		if(path_position>=1){
			sprite_index=sprites[0];
			x=targX*tS;
			y=targY*tS;
			
			path_delete(path);
		}
	}
}//keep path clear to prevent memory leaks