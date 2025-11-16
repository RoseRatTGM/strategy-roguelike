///@desc 
selected=noone;
target=noone;
party=[0,1];
canMove=true; //when hovering over ui elements you can't move to that tile
qAction=-1; //queued action

var pNum=array_length(party);
for(var i=0;i<pNum;i++){
	var file=file_text_open_write(working_directory+$"{global.characters[party[i],0]}.txt"); //name
	for(var j=1;j<array_length(global.characters[party[i]]);j++){ //all info for one character
		file_text_write_string(file,$"{global.characters[party[i],j]}\n"); //copy info to file
	}
	file_text_close(file);
	with(instance_create_depth((rW*.5)-((pNum*.5)*tS)+(i*tS),y,-98,obj_char)){
		index=other.party[i];
		identity=global.characters[index,0];
	}
}//write party information to files

state_battle=function(){
	var click=mouse_check_button_pressed(mb_left);
	//inputs
	
	if(click){
		if(selected!=noone){
			if(instance_position(mouse_x,mouse_y,obj_char)&&instance_position(mouse_x,mouse_y,obj_char)!=selected){
				selected=instance_position(mouse_x,mouse_y,obj_char);
				qAction=-1;
			}//select a different character
			else{
				with(selected){
					if(floor(mouse_x/tS)==targX&&floor(mouse_y/tS)==targY){
						other.selected=noone;
					}//deselect
					else if((targX==x/tS||targY==y/tS)&&canMoveToSel&&other.canMove){ //if stationary and the targeted tile is a valid tile to move to
						targX=floor(mouse_x/tS);
						targY=floor(mouse_y/tS);
					}//move
				}
			}
		}
		else{
			if(instance_position(mouse_x,mouse_y,obj_char)){
				selected=instance_position(mouse_x,mouse_y,obj_char);
				qAction=-1;
			}
		}//select character
	}
	
	if(qAction>-1&&selected!=noone&&target!=noone){
		with(selected){
			perform_action(other.qAction,other.target);
		}
	}//actions
}

state=state_battle;