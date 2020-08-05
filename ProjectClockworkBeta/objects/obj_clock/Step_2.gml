var _player = instance_find(obj_player,0)

// riding mechanics
if riding != noone {
	x = riding.x + ridingOffX
	y = riding.y + ridingOffY
}

// checking if there is a place meeting, if there is make pressable
if place_meeting(x,y,_player) {
	inRange = true
	buttonImage_index += 0.1
} else {
	inRange = false
	buttonImage_index = 0
}

// player interacting (making the player "stick" to the clock)
if !active {
	if keyboard_check(ord("J")) and inRange { // going into the clock state
		active = true
		_player.clockRewinding = self
		_player.y = y-8
		if _player.x >= x+8 {
			_player.image_xscale = -1
		} else {
			_player.image_xscale = 1
		}
		_player.clockOffX = _player.x - x
		_player.clockOffY = _player.y - y
		_player.velX = 0
		_player.velY = 0
		_player.sprite_index = spr_playerClockwork
		_player.image_yscale = 1
		
		// setting the alarm for clocklock
		clockLock = true
		alarm[0] = 15
	}
} else {
	if !keyboard_check(ord("J")) and !clockLock{
		active = false
		_player.y = y + _player.clockOffY
		_player.clockRewinding = noone
	}
}