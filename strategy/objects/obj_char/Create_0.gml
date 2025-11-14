///@desc variables
targX=x/tS; //target x position
targY=y/tS; //target y position
//destination
mDist=[];
canMoveToSel=false;
//movement checking
stats=[10,10,5,0,1,0,3,0,5,0]; //hp, mhp, atk, temp atk change, def, def c, spd, spd c, mind, stress
actions=[0]; //what can you do on a turn?
identity=""; //which file to read info from, basically
index=0;
spd=0;
//character information
perform_action=function(action,target){
	switch(action){
		case 0: //shoot
			target.image_xscale=3;
			obj_plr.target=noone;
		break;
	}
}

alarm[0]=1;