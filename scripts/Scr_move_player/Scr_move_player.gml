
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

	// --- Controle de aceleração ---
	if (drive) {
	    velocidade += aceleracao;
	} else if (reverse) {
	    velocidade -= freio;
	} else {
	    // desaceleração natural
	    if (velocidade > 0) {
	        velocidade -= desaceleracao;
	        if (velocidade < 0) velocidade = 0;
	    }
	    if (velocidade < 0) {
	        velocidade += desaceleracao;
	        if (velocidade > 0) velocidade = 0;
	    }
	}

	// --- Limites de velocidade ---
	velocidade = clamp(velocidade, -veloc_max, veloc_max);

	// --- Rotação só se o carro estiver se movendo ---
	if (velocidade != 0) {
	    if (left)  direction += 2;
	    if (right) direction -= 2;
	    image_angle = direction;
	}

	// --- Movimento com colisão ---
	var newx = x + lengthdir_x(velocidade, direction);
	var newy = y + lengthdir_y(velocidade, direction);

	if (!place_meeting(newx, newy, O_wall)) {
	    x = newx;
	    y = newy;
	} else {
	    // checa passo a passo até encostar
	    var steps = abs(velocidade);
	    repeat (steps) {
	        var step_x = x + lengthdir_x(sign(velocidade), direction);
	        var step_y = y + lengthdir_y(sign(velocidade), direction);

	        if (!place_meeting(step_x, step_y, O_wall)) {
	            x = step_x;
	            y = step_y;
	        } else {
	            velocidade = 0; // bateu, perde velocidade
	            break;
	        }
	    }
	}

}



