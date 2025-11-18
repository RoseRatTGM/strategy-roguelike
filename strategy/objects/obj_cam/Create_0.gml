#region init
randomize();
#macro rW 256 //room/screen width
#macro rH 144 //room/screen height
#macro tS 16 //tile size
window_set_cursor(cr_none); //hide the cursor
snapToPlayer=false;

shakeLen=0;
shakeForce=0;
shakeTime=0;
//screenshake

surf=surface_create(display_get_gui_width(),display_get_gui_height());
//surface

depth=-100;

debug=false;
//debug mode

sTime=0; //how long should time be slowed
global.tFactor=1; //time factor, slowdown
global.pad=-1; //controller
//global variables

inpArr=[]; //inputs

#region menu
global.sfxVol=.5;
global.frameStyle=2;
//settings
paused=false;
mCd=0; //mouse clicking cooldown

pMenu=0; //0 is pause menu
pMArr[0]=["Resume","Options","Exit"]; //pause menu
pMArr[1]=["Control Type: N/A","Volume","Back"]; //options menu
pMArr[2]=["Master Volume: 0%","SFX Volume: 0%","Music Volume: 0%","Back"]; //volume menu
pMInd=0; //pause menu array index
sInd=0; //sub-menu array index
sIndPrev=0; //previous sub-menu array index
#endregion

global.solids=[obj_nme_par,obj_char];
global.mpGrid=mp_grid_create(0,0,rW/tS,rH/tS,tS,tS);
//setup
for(var i=0;i<array_length(global.solids);i++){
	mp_grid_add_instances(global.mpGrid,global.solids[i],false);
}//add solid objects to grid

var tiles=layer_tilemap_get_id("Tiles");
for(var i=0;i<tilemap_get_width(tiles);i++){
	for(var j=0;j<tilemap_get_height(tiles);j++){
		if(!tile_get_empty(tilemap_get(tiles,i,j))){
			mp_grid_add_cell(global.mpGrid,i,j);
		}//if this tile is occupied
	}
}//add tiles to grid

#endregion

#region character info
global.characters=[
//name, hp, mhp, attack, t atk change, def, def c, spd,spd c, mind, stress
//then actions
["Cranson",10,10,5,0,1,0,3,0,5,0,0],
["Blurtus",10,10,5,0,1,0,3,0,5,0,3],
];

global.actions=[
//action card sprite, entity sprite style (2: shoot, 3: hit,
//4: special/unique), range, action name, action description
[0,2,10,"Pistol","Ranged, single-target damage. Best at mid-range."],
[1,2,16,"Rifle","Ranged, single-target damage. Best at long-range."],
[2,2,6,"Shotgun","Ranged, area of effect damage. Best at close-range."],
[3,3,1,"Punch","Melee, single-target damage."],
];
#endregion

#region display manager
aRatio=display_get_width()/display_get_height();
iHeight=rH;
iWidth=round(iHeight*aRatio);
if(iWidth&1){
	iWidth++;
}
if(iHeight&1){
	iHeight++;
}
wScale=min(floor(display_get_width()/iWidth),floor(display_get_height()/iHeight));
if(iHeight*wScale==display_get_height()){
	wScale--;
}
window_set_size(iWidth*wScale,iHeight*wScale);
alarm[0]=1;

//display manager
#endregion