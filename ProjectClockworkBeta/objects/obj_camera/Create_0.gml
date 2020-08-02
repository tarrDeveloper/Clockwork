// setting variables for camera stats
camWidth = camera_get_view_width(view_camera[0])
camHeight = camera_get_view_height(view_camera[0])

// setting the position to be the center of the camera at start
x = camera_get_view_x(view_camera[0])+camWidth/2
y = camera_get_view_y(view_camera[0])+camHeight/2