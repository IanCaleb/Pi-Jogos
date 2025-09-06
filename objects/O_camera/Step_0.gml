if(instance_exists(O_car)){
	x = lerp(x,target.x - cam_largura / 2, cam_velc);
	y = lerp(y,target.y - cam_altura / 2, cam_velc);
	
	camera_set_view_pos(view_camera[0],x,y)
}
else{
	target = -1;
}