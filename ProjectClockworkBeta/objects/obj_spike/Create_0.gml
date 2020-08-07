// spike vals
myClock = noone
inc    = 1
dec    = 1

val = 0
oldVal = val

spikeState   = 0
spikeStateTo = 0

xDir = lengthdir_x(1,image_angle)
yDir = lengthdir_y(1,image_angle)
xDrawDir = lengthdir_x(1,image_angle-90)
yDrawDir = lengthdir_y(1,image_angle-90)

xLock = x
yLock = y

spikeNum = floor(image_yscale)
deadly = false

mute = false

tickTimer = 10
inverse = 0