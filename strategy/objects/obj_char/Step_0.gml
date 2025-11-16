///@desc tile validity check
event_inherited();

#region check if the tile the mouse is hovering over is valid to move to
mDist=[abs(targX-floor(mouse_x/tS)),abs(targY-floor(mouse_y/tS))];
//how far is the mouse from myself?

spd=stats[6]+stats[7];
//what is the player's effective speed stat

canMoveToSel=false;
if((mDist[0]<=spd&&mDist[1]<=spd) //is the tile within movement speed?
&&(mDist[0]+mDist[1])<=spd //including diagonals
&&!place_meeting(floor(mouse_x/tS)*tS,floor(mouse_y/tS)*tS,solidObjects) //and not already occupied
){ //some way to check whether you can actually get to the indicated tile
	canMoveToSel=true;
}
//is the tile the mouse is hovering over valid?
#endregion