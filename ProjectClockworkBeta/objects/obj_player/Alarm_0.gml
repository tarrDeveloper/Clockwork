// making particles
if grounded and abs(velX) >= accelXCap {
	part_particles_create(obj_control.partSystem,xprevious,yprevious+10,obj_control.partDust,1)
}

alarm[0] = irandom_range(1,dustTimer)