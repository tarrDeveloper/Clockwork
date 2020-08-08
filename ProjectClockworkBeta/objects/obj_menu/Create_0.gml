menuItems = ds_list_create()
ds_list_add(menuItems,"Resume")
ds_list_add(menuItems,"Home Screen")

maxSelection = ds_list_size(menuItems)-1
currentSelection = 0

selectTimer = 45
selectAlpha = 1
selected = -1

itemColor = make_color_rgb(189,204,187)