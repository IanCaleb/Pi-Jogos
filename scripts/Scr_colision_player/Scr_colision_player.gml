function Scr_colision_player(){
	if(place_meeting(x + veloc, y, O_wall)){
		
		while(!place_meeting(x + sign(veloc), y, O_wall)){
			x += sign(veloc); 
		};
		veloc = 0;
	}
	
	if(place_meeting(x, y + veloc, O_wall)){
		
		while(!place_meeting(x, y + sign(veloc), O_wall)){
			y += sign(veloc); 
		};
		veloc = 0;
	}


}