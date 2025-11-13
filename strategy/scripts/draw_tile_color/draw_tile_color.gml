// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_tile_color(tile_x,tile_y,color,alpha=1){
	draw_set_alpha(alpha);
	draw_rectangle_color(	((floor(tile_x)-.5)*tS)+(tS*.5),((floor(tile_y)-.5)*tS)+(tS*.5),
							((floor(tile_x)+.5)*tS)+(tS*.5),((floor(tile_y)+.5)*tS)+(tS*.5),
	color,color,color,color,false);
	draw_set_alpha(1);
}