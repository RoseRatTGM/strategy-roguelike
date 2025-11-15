///@desc set tilemap, target coords
tMap=layer_tilemap_get_id("Tiles"); //collision tilemap
solidObjects=[tMap];
for(var i=0;i<array_length(global.solids);i++){
	array_push(solidObjects,global.solids[i]);
}

targX=x/tS; //target x position
targY=y/tS; //target y position
//destination
path=-1;
sprites=[spr_plr_1,spr_plr_1_run];