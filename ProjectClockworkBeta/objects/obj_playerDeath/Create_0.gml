// vars that will be player vars
velX = 0
velY = 0

dampX = .4
dampY = .4

// setting the vars needed for the death animation
animAngle = 0
animAngleTo = 360

animSize  = 0

t = 5

deathColor = make_color_rgb(34,35,35)

// metavars
animStart = false
freezeTimer = 2

// creating a surface for the animatino so it is pixelated
animSurface = surface_create(room_width,room_height)

// shaking the screen a lil
screenShake(2,2)