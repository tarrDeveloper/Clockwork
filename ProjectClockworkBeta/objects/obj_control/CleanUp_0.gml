ds_grid_destroy(mapGrid)
ds_map_destroy(mapList)

surface_free(gearSurface)

var _size = ds_list_size(emitters_to_free)
for(i=0;i<_size;i++) {
	audio_emitter_free(ds_list_find_value(emitters_to_free,i))
}
ds_list_destroy(emitters_to_free)