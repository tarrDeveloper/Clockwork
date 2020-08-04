if animStart {
	// lerping the animation values
	animSize = dsin(t*4)*3
	animAngle = lerp(animAngle,animAngleTo,.05)

	// drawing the death effect
	if surface_exists(animSurface) {
		surface_set_target(animSurface)
	
		// clearing the surface
		draw_clear_alpha(c_black,0)
	
		// drawing the circles
		var _circleNum = 6
		for(i=0;i<_circleNum;i++) {
			var _circleX = lengthdir_x(animSize*3,animAngle + (i/_circleNum)*360) + x
			var _circleY = lengthdir_y(animSize*3,animAngle + (i/_circleNum)*360) + y
		
			draw_set_color(deathColor)
			draw_circle(_circleX,_circleY,animSize+1,false)
			draw_set_color(c_white)
		}
		surface_reset_target()
	
		// drawing the surface
		draw_surface(animSurface,0,0)
	}
} else {
	draw_self()
}