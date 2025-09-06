function Scr_acceleration(){
	
	if keyboard_check_pressed(vk_space){
		veloc_max *= 2
		sprite_index = S_delorian_acceleration;
	}
	
	if keyboard_check_released(vk_space){
		veloc_max /= 2
		sprite_index = S_delorian;
	}
	
	if keyboard_check_pressed(ord("Z")){
		veloc_max *= 2.5
		sprite_index = S_delorian_acceleration_purple;
	}
	
	if keyboard_check_released(ord("Z")){
		veloc_max /= 2.5
		sprite_index = S_delorian;
	}
}