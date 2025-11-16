///@desc movement
if(abs(oldX-floor(x/tS))>=1){
	tilesMoved++;
	oldX=floor(x/tS);
}//count tiles crossed horizontally
if(abs(oldY-floor(y/tS))>=1){
	tilesMoved++;
	oldY=floor(y/tS);
}//count tiles crossed vertically
if(tilesMoved>=spd){
	targX=floor(x/tS);
	targY=floor(y/tS);
	path_position=1;
}
//limit movement

if((targX!=x/tS||targY!=y/tS)&&!path_exists(path)){
	sprite_index=sprites[1];
	x+=(sprite_width*.5);
	y+=(sprite_height*.5);
	//prepare to move
	
	path=path_add();
	if(mp_grid_path(global.mpGrid,path,x,y,(targX*tS)+(tS*.5),(targY*tS)+(tS*.5),false)){
		path_start(path,1.5,path_action_stop,0);
	}//create and start a movement path to the target
}
else{
	if(path_exists(path)){
		if(path_position>=1){
			sprite_index=sprites[0];
			x=targX*tS;
			y=targY*tS;
			tilesMoved=0;
			//stop moving
			
			path_delete(path);
			//keep path clear to prevent memory leaks
		}
	}
}
//move to correct point