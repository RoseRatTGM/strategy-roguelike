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
distMod=0; //distance modifier
actNum=1; //how many actions can you take this turn
//character information
hasAnimated=false;
sprites=[spr_plr_1,spr_plr_1_run,spr_plr_1_shoot,spr_plr_1_hit]; //idle, move, shoot, hit
//sprite information

perform_action=function(action,target){
	var X=floor(x/tS);
	var Y=floor(y/tS);
	var tX=floor(target.x/tS);
	var tY=floor(target.y/tS);
	//simplified location data
	
	if((abs(tX-X)+abs(tY-Y))*.5<=global.actions[action,2]&&collision_line(x,y,target.x,target.y,solidObjects,false,false)){
		sprite_index=sprites[global.actions[action,1]];
		//play action's sprite
	}
	else{
		obj_plr.qAction=-1;
		//idk play an error sound or something
	}
	
	if(hasAnimated){
		actNum--;
		switch(action){
			case 0: //pistol
				distMod=4-((abs(tX-X)+abs(tY-Y))*.5);
				//calculate dist mod
				target.stats[0]-=max(((stats[2]+stats[3])* //hp-attack
				(target.stats[4]+target.stats[5]))- //reduced by defense
				distMod,.1); //affected by distance
			break;
			case 3: //punch
				target.stats[0]-=max((stats[2]+stats[3])
				*(target.stats[4]+target.stats[5]),.1);
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