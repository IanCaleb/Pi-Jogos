
function Scr_move_player(){
	/*
	var left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	var right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	var drive = keyboard_check(vk_up) or keyboard_check(ord("W"));
	var reverse = keyboard_check(vk_down) or keyboard_check(ord("S"));


	//Faz o carro acelerar pra frente e pra trás
	if (reverse == 1){
		speed = -veloc;
	}
	
	if (drive == 1){
		speed = veloc;
	}
	
	
	
	
	//Faz o carro parar quando não está apertando nem pra frente nem pra trás
	if (!drive and !reverse){
		speed = 0;
	}
	
	
	
	
	//Só muda o angulo enquanto o carro está andando
	if (drive or reverse){
	
		if(left){ 
			direction += 2;
		}

		if(right){ 
			direction -= 2;
		}
	
		image_angle = direction;
	}
	*/
	
	
	
	/// Scr_move_player()

	var left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	var right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	var drive = keyboard_check(vk_up) or keyboard_check(ord("W"));
	var reverse = keyboard_check(vk_down) or keyboard_check(ord("S"));

	var spd = 0;
	if (drive) spd = veloc;
	if (reverse) spd = -veloc;

	// Rotação só se o carro estiver se movendo
	if (spd != 0) {
	    if (left)  direction += 2;
	    if (right) direction -= 2;
	    image_angle = direction;
	}

	// --- Cálculo da posição alvo ---
	var newx = x + lengthdir_x(spd, direction);
	var newy = y + lengthdir_y(spd, direction);

	// --- Colisão mais precisa ---
	if (!place_meeting(newx, newy, O_wall)) {
	    // livre, pode andar
	    x = newx;
	    y = newy;
	} else {
	    // move passo a passo até encostar na parede sem atravessar
	    var steps = abs(spd); // quantos pixels vamos tentar andar
	    var moved = false;

	    repeat (steps) {
	        var step_x = x + lengthdir_x(sign(spd) + 5, direction);
	        var step_y = y + lengthdir_y(sign(spd) + 5, direction);

	        if (!place_meeting(step_x, step_y, O_wall)) {
	            x = step_x;
	            y = step_y;
	            moved = true;
	        } else {
	            break; // bateu, para aqui
	        }
	    }
	}

}



