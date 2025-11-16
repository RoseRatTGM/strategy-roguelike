///@desc variables
event_inherited();

mDist=[];
canMoveToSel=false;
//movement checking
stats=[0,0,0,0,0,0,0,0,0,0]; //placeholder stats to replace immediately
actions=[0]; //what can you do on a turn?
identity=""; //which file to read info from, basically
index=0;
spd=0;
//character information
hasAnimated=false;
sprites=[spr_plr_1,spr_plr_1_run, spr_plr_1_shoot]; //idle, move, shoot, hit
//sprite information

perform_action=function(action,target){
	sprite_index=sprites[global.actions[action,1]];
	//play action's sprite
	
	if(hasAnimated){
		switch(action){
			case 0: //pistol
				var distMod=4-abs(floor(target.x/tS)-floor(x/tS));
				target.stats[0]-=(stats[2]+stats[3])* //hp-attack
				(target.stats[4]+target.stats[5])* //reduced by defense
				distMod; //affected by distance
			break;
		}
		//perform action
		
		obj_plr.target=noone;
		obj_plr.qAction=-1;
		hasAnimated=false;
		sprite_index=sprites[0];
		image_index=0;
		//reset
	}
}//actions

alarm[0]=1;
//character information