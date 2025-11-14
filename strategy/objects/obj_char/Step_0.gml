///@desc movement, tile validity check
if(targX!=x/tS){
	x+=sign(targX-(x/tS));
}//move to target x if not on it
if(targY!=y/tS){
	y+=sign(targY-(y/tS));
}//move to target x if not on it

mDist=[abs(targX-floor(mouse_x/tS)),abs(targY-floor(mouse_y/tS))];
//how far is the mouse from myself?

spd=stats[6]+stats[7];
//what is the player's effective speed stat

canMoveToSel=false;
if((mDist[0]<=stats[6]&&mDist[1]<=spd) //is the tile within movement speed?
&&(mDist[0]+mDist[1])<=spd*1.5){ //including diagonals
	canMoveToSel=true;
}
//is the tile the mouse is hovering over valid?