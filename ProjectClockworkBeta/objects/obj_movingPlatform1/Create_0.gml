event_inherited() // parent

depth = 125

// stores my corresponding clock
myClock = noone

// stores points for max
xmin = x
ymin = y
xmax = x
ymax = y

// how much I accelerate in each direction
accelX  = 0
accelY  = 0
deccelX = 0
deccelY = 0

// vars that stores velocity
oldVelX = 0
oldVelY = 0
velX    = 0
velY    = 0
velXMax = 64
velYMax = 64

// adding a bit of latency to the velocity for player inaccuracy
latentVelX = 0
latentTimer = 0

// for visual stuff
image_speed = 0

// audio stuff
tickTimer = .1
mute = false

myAudioEmitter = audio_emitter_create()