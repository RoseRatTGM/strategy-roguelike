/// @desc controller connection
switch(async_load[? "event_type"]){
	case "gamepad discovered": //controller connected
		global.pad=async_load[? "pad_index"];
		gamepad_set_axis_deadzone(global.pad,.3);
	break;
	case "gamepad lost": //controller disconnected
		global.pad=-1;
	break;
}