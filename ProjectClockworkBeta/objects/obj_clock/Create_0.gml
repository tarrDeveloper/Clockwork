// this var keeps track if the player is in range
inRange = false

// these variables control the value the clock is at
val = 0 // var from 0 to 1 that stores where I should ne

valVel = 0 // the current velocity for the value
valAcc = .0025 // the acceleration for the value
valDec = .0025 // the decceleration for the value


// these variables keep track if the clock is riding a platform
riding = noone // var to track if this clock is riding something
ridingOffX = -1 // change these when you set a rider to this
ridingOffY = -1

// visual vars
image_speed = 0
buttonImage_index = 0 // image_index for the signifier