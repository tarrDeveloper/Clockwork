dustSurface = surface_create(room_width,room_height)

// particle system for stuff
partSystem = part_system_create()
part_system_depth(partSystem,300)
part_system_automatic_draw(partSystem,false)

partDust = part_type_create()
part_type_sprite(partDust,spr_dust,0,0,0)
part_type_size(partDust,1,1.2,-.08,0)
part_type_direction(partDust,50,130,0,0)
part_type_speed(partDust,.5,.6,0,0)
part_type_life(partDust,12,12)
part_type_gravity(partDust,.01,270)