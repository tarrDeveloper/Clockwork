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

mapGrid = ds_grid_create(10,6)
ds_grid_set(mapGrid,0,0,rm0Start)
ds_grid_set(mapGrid,1,0,rm1Warm)
ds_grid_set(mapGrid,2,0,rm2Platform)
ds_grid_set(mapGrid,3,0,rm3Launch)
ds_grid_set(mapGrid,3,1,rm4LaunchLand)
ds_grid_set(mapGrid,2,1,rm5Combo)
ds_grid_set(mapGrid,1,1,rm6Velocity)
ds_grid_set(mapGrid,0,1,rm7Elevator)
ds_grid_set(mapGrid,0,2,rm8Spikes)
ds_grid_set(mapGrid,1,2,rm9Bounce)
ds_grid_set(mapGrid,2,2,rm10ControlSpikes)
ds_grid_set(mapGrid,3,2,rm11SpikeyRide)
ds_grid_set(mapGrid,4,2,rm12Gauntlet)
ds_grid_set(mapGrid,5,2,rm13Skybound)
ds_grid_set(mapGrid,5,3,rm14SpikeShot)
ds_grid_set(mapGrid,6,3,rm15Zigzag)
ds_grid_set(mapGrid,6,4,rm16Dejavu)
ds_grid_set(mapGrid,6,5,rm17Push)
ds_grid_set(mapGrid,7,5,rm18Shifty)
ds_grid_set(mapGrid,8,5,rm19Slingshot)
ds_grid_set(mapGrid,9,5,rm20Rewind)

enum mpDir {
	right,
	left,
	up,
	down,
	none,
}

mapList = ds_map_create()
ds_map_set(mapList,rm0Start,mpDir.right)
ds_map_set(mapList,rm1Warm,mpDir.right)
ds_map_set(mapList,rm2Platform,mpDir.right)
ds_map_set(mapList,rm3Launch,mpDir.up)
ds_map_set(mapList,rm4LaunchLand,mpDir.left)
ds_map_set(mapList,rm5Combo,mpDir.left)
ds_map_set(mapList,rm6Velocity,mpDir.left)
ds_map_set(mapList,rm7Elevator,mpDir.up)
ds_map_set(mapList,rm8Spikes,mpDir.right)
ds_map_set(mapList,rm9Bounce,mpDir.right)
ds_map_set(mapList,rm10ControlSpikes,mpDir.right)
ds_map_set(mapList,rm11SpikeyRide,mpDir.right)
ds_map_set(mapList,rm12Gauntlet,mpDir.right)
ds_map_set(mapList,rm13Skybound,mpDir.up)
ds_map_set(mapList,rm14SpikeShot,mpDir.right)
ds_map_set(mapList,rm15Zigzag,mpDir.up)
ds_map_set(mapList,rm16Dejavu,mpDir.up)
ds_map_set(mapList,rm17Push,mpDir.right)
ds_map_set(mapList,rm18Shifty,mpDir.right)
ds_map_set(mapList,rm19Slingshot,mpDir.right)
ds_map_set(mapList,rm20Rewind,mpDir.none)

// the coordinates of the player
mx = sx
my = sy

// having a surface for the gears and stuff
gearSurface = surface_create(room_width,room_height)

// creating the part system
instance_create_depth(0,0,150,obj_partSystem)

// handling sounds


// dev
devRoomChange = false
//show_debug_overlay(true)

ds_set_precision(.001)