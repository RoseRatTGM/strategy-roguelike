///@desc variables
event_inherited();

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
hasAnimated=false;
sprite=spr_plr_1;
//sprite information

perform_action=function(action,target){
	sprite_index=global.actions[action,1];
	//play action's sprite
	
	if(hasAnimated){
		switch(action){
			case 0: //shoot
				target.stats[0]-=(stats[2]+stats[3])*(target.stats[4]+target.stats[5]);
			break;
		}
		//perform action
		
		obj_plr.target=noone;
		obj_plr.qAction=-1;
		hasAnimated=false;
		sprite_index=sprite;
		image_index=0;
		//reset
	}
}//actions

alarm[0]=1;
//character information