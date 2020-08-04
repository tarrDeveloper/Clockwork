draw_self()

if inRange and instance_exists(obj_player) and obj_player.clockRewinding = noone {
	draw_sprite(spr_clockRewindButton,buttonImage_index,x,y)
}