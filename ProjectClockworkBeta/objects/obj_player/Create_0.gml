// vars for bounding box
bboxRightLen  = bbox_right - x
bboxLeftLen   = x - bbox_left
bboxTopLen    = y - bbox_top
bboxBottomLen = bbox_bottom - y

velX = 0
velY = 0

velXOff = 0
velYOff = 0

// platform specific mechanics
accelX  = .25
deccelX = .25
accelXCap = 1.5

grav = .35
gravYCap = 5

jumpMag = 4
jumpTimer = 0
jumpGrace = 0

riding = noone

oldGrounded = false

// this keeps track of what clock teh player is winding up
clockRewinding = noone
clockOffX = 0 // how far away from the clock the player is
clockOffY = 0

// drawing
xDraw = x
yDraw = y