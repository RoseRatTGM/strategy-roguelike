///@desc fill out charcter information
var file=file_text_open_read(working_directory+$"{identity}.txt");

for(var i=0;i<array_length(stats);i++){
	stats[i]=file_text_read_real(file);
	file_text_readln(file);
}//stats array

var num=0;
while(!file_text_eof(file)){
	actions[num++]=file_text_read_real(file);
	file_text_readln(file);
}//actions array

file_text_close(file);