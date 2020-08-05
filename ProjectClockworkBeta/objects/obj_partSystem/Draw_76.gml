// drawing the particle system to the surface
surface_set_target(dustSurface)
draw_clear_alpha(c_black,0)
part_system_drawit(partSystem)
surface_reset_target()