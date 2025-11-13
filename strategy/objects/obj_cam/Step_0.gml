#region camera
if(instance_exists(obj_plr)){
	var xCam=clamp(obj_plr.x-(rW/2),0,(room_width-rW));
	var yCam=clamp(obj_plr.y-(rH/2),0,(room_height-rH));

	var curX=camera_get_view_x(view_camera[0]);
	var curY=camera_get_view_y(view_camera[0]);

	var newX=lerp(curX,xCam,.1);
	var newY=lerp(curY,yCam,.1);

	if(snapToPlayer){
		snapToPlayer=false;
		var xMove=xCam;
		var yMove=yCam;
	}
	else{
		var xMove=newX;
		var yMove=newY;
	}

	xMove+=random_range(-shakeTime,shakeTime);
	yMove+=random_range(-shakeTime,shakeTime);
	shakeTime=max(0,shakeTime-(1/shakeLen)*shakeForce);
	//screenshake
	
	camera_set_view_pos(view_camera[0], xMove, yMove);
	layer_x(layer_get_id("Background"), xMove * 0.65);
	layer_y(layer_get_id("Background"), yMove * 0.65);


	layer_x(layer_get_id("Background"), newX * 0.65);
	layer_y(layer_get_id("Background"), newY * 0.65);
}
#endregion

#region inputs
inpArr=[
gamepad_button_check(global.pad,gp_padr)||keyboard_check(ord("D")),
//right
gamepad_button_check(global.pad,gp_padl)||keyboard_check(ord("A")),
//left
gamepad_button_check(global.pad,gp_padd)||keyboard_check(ord("S")),
//down
gamepad_button_check(global.pad,gp_padu)||keyboard_check(ord("W")),
//up
gamepad_button_check_pressed(global.pad,gp_start)||keyboard_check_pressed(vk_escape),
//pause
gamepad_button_check_pressed(global.pad,gp_face1)||keyboard_check_pressed(vk_enter),
//menu confirm
gamepad_button_check_pressed(global.pad,gp_face2),
//menu deny
gamepad_button_check_pressed(global.pad,gp_padd)||keyboard_check_pressed(ord("S")),
//menu down
gamepad_button_check_pressed(global.pad,gp_padu)||keyboard_check_pressed(ord("W")),
//menu up
keyboard_check_pressed(ord("R"))||gamepad_button_check_pressed(global.pad,gp_stickl),
//reset
];
#endregion

#region controller

#region pausing
var pause=inpArr[4];
if(pause){
	switch(paused){
		case 0: //pause
			instance_deactivate_all(true);
			paused=true;
		break;
		case 1: //resume
			instance_activate_all();
			paused=false;
			//unpause
			pMInd=0;
			pMenu=0;
			sInd=0;
			//reset indices
		break;
	}
	//stop the game
	if(pause){
		pMenu=0;
	}//open pause menu when paused
}

#endregion

#region menu
pMArr[2,1]="SFX Volume: "+string_format(global.sfxVol*100,3,0)+"%"; //volume
//keep menu entries updated

mCd=max(mCd-1,0); //mouse cooldown

if(paused){
	sInd+=inpArr[15]-inpArr[16];
	sInd=clamp(sInd,0,array_length(pMArr[pMInd])-1);
	//process inputs
	
	if(sInd!=sIndPrev){
		/*
		if(!audio_is_playing(snd_menu_confirm)&&sInd>=0){
			audio_play_sound(snd_ding,0,false,global.sfxVol);
		}//sound when navigating menu
		*/
		sIndPrev=sInd;
	}//play sound only once
	
	function process_menu(confirm){
		if(confirm){ //confirm
			mCd=10;
			switch(pMInd){
				case 0: //main pause menu
					switch(sInd){
						case 0: //Resume
							instance_activate_all();
							paused=false;
						break;
						case 1: //Options
							pMInd=1;
							sInd=0;
						break;
						case 2: //Main Menu
							game_end();
							paused=false;
						break;
					}
				break;
				case 1: //options menu
					switch(sInd){
						case 0: //Controls
							
						break;
						case 1: //Volume
							pMInd=2;
							sInd=0;
						break;
						case 2: //Back
							pMInd=0;
							sInd=1;
						break;
					}
				break;
				case 2: //volume menu
					switch(sInd){
						case 0: //Master
							
						break;
						case 1: //SFX
							global.sfxVol+=.1;
							if(global.sfxVol>1){
								global.sfxVol=0;
							}
							//change sound effects volume
						break;
						case 2: //Music
							
						break;
						case 3: //Back
							pMInd=1;
							sInd=1;
						break;
					}
				break;
			}
			/*
			if(!audio_is_playing(snd_menu_confirm)){
				audio_play_sound(snd_menu_confirm,0,false,global.sfxVol);
			}//sound when pressing confirm
			*/
		}
	}

	process_menu(inpArr[5]);
	//run menu processing
}
#endregion

#region other
if(keyboard_check_pressed(vk_f11)){
	window_set_fullscreen((window_get_fullscreen()+1)%2);
}//toggle fullscreen

sTime=max(sTime-1,0);
if(!sTime){
	global.tFactor=1;
}//manage tFactor
#endregion

#endregion

if(inpArr[9]){
	room_restart();
	global.tFactor=1;
}//restart

if(keyboard_check_pressed(ord("Q"))){
	debug=(debug+1)%2;
}//toggle debug