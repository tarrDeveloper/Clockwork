surface_set_target(gearSurface)

draw_clear_alpha(c_black,0) // clearing

var _platNum = instance_number(obj_movingPlatform1) // drawing teh gears
for(i=0;i<_platNum;i++) {
	with instance_find(obj_movingPlatform1,i) {
		var _dir = point_direction(xs,ys,xe,ye)
		var _dist = point_distance(xs,ys,xe,ye)

		draw_sprite_ext(spr_track,0,xs,ys,_dist,1,_dir,c_white,1)
		
		draw_sprite(spr_majorNotch,image_index,xs,ys)
		draw_sprite(spr_majorNotch,image_index,xe,ye)
	}
}
surface_reset_target()