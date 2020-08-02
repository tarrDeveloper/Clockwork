// moving the player first to recieve direct influence from moving solids
ActorMoveX(velX)
ActorMoveY(velY)

// getting the input
var _hInp = keyboard_check(vk_right) - keyboard_check(vk_left)
var _vInp = keyboard_check(vk_down)  - keyboard_check(vk_up)

velX += .1*_hInp
velY += .1*_vInp