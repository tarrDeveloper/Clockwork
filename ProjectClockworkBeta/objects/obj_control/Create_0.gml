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

mapGrid = ds_grid_create(4,4)
ds_grid_add(mapGrid,0,0,rm1_start)

// the coordinates of the player
mx = sx
my = sy