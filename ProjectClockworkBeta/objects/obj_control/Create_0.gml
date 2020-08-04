// having vars for the offset of the clouds background
clouds0off   = 0
clouds1off   = 0
clouds2off   = 0

// setting variables for camera stats
camWidth = camera_get_view_width(view_camera[0])
camHeight = camera_get_view_height(view_camera[0])

// setting the position to be the center of the camera at start
x = camera_get_view_x(view_camera[0])+camWidth/2
y = camera_get_view_y(view_camera[0])+camHeight/2

// variables for screenshake
screenShakeTimer = 0
screenShakeMagnitude = 0

// variable to keep track of the map data
sx = 0
sy = 0

mapGrid = ds_grid_create(5,5)
ds_grid_set(mapGrid,0,0,rm0Start)
ds_grid_set(mapGrid,1,0,rm1Warm)
ds_grid_set(mapGrid,2,0,rm2Platform)
ds_grid_set(mapGrid,3,0,rm3Launch)
ds_grid_set(mapGrid,3,1,rm4LaunchLand)
ds_grid_set(mapGrid,2,1,rm5Combo)

enum mpDir {
	right,
	left,
	up,
	down,
}

mapList = ds_map_create()
ds_map_set(mapList,rm0Start,mpDir.right)
ds_map_set(mapList,rm1Warm,mpDir.right)
ds_map_set(mapList,rm2Platform,mpDir.right)
ds_map_set(mapList,rm3Launch,mpDir.up)
ds_map_set(mapList,rm4LaunchLand,mpDir.left)
ds_map_set(mapList,rm5Combo,mpDir.left)

// the coordinates of the player
mx = sx
my = sy

// dev
devRoomChange = false
show_debug_overlay(true)