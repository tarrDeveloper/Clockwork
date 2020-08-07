// these functions get the bounding box parts of an entity
function BboxRight(_ent)  {return round((_ent.x+_ent.bboxRightLen)*100)/100}
function BboxLeft(_ent)   {return round((_ent.x-_ent.bboxLeftLen)*100)/100}
function BboxTop(_ent)    {return round((_ent.y-_ent.bboxTopLen)*100)/100}
function BboxBottom(_ent) {return round((_ent.y+_ent.bboxBottomLen)*100)/100}

// these function check if an entity is overlapping a certain object
function checkOverlap(_x,_y,_objectType) {
	var _myBboxRight  = round((_x+bboxRightLen)*100)/100
	var _myBboxLeft   = round((_x-bboxLeftLen)*100)/100
	var _myBboxTop    = round((_y-bboxTopLen)*100)/100
	var _myBboxBottom = round((_y+bboxBottomLen)*100)/100
	
	var _objectNumber = instance_number(_objectType)
	for(i=0;i<_objectNumber;i++) {
		var _currentObject = instance_find(_objectType,i)
		if _myBboxLeft < BboxRight(_currentObject) and _myBboxRight > BboxLeft(_currentObject) and _myBboxTop < BboxBottom(_currentObject) and _myBboxBottom > BboxTop(_currentObject) {
			return _currentObject
		}
	}
	return noone
}

// these two functions move an actor and return who they collided with
function ActorMoveX(_amt) {
	x += _amt
	var _col = checkOverlap(x,y,obj_solid)
	if _col != noone {
		if _amt > 0 {
			x += BboxLeft(_col)-BboxRight(self)
			velX = _col.velX
			return _col
		} else if _amt < 0 {
			x += BboxRight(_col)-BboxLeft(self)
			velX = _col.velX
			return _col
		}
	}
	return noone
}

function ActorMoveY(_amt) {
	y += _amt
	var _col = checkOverlap(x,y,obj_solid)
	if _col != noone {
		if _amt > 0 {
			y += BboxTop(_col)-BboxBottom(self)
			velY = _col.velY
			if oldGrounded riding = _col
			return _col
		} else {
			y += BboxBottom(_col)-BboxTop(self)
			velY = _col.velY
			return _col
		}

	}
	return noone
}

// this function moves a solid and pushes actors
function SolidMove(_amtX,_amtY) {
	x += _amtX
	var _velX = x-xprevious
	var _player = checkOverlap(x,y,obj_player)
	if _player != noone { // pushing the player
		if _amtX > 0 {
			var _snap = BboxRight(id)-BboxLeft(_player)
			if _player.velX < _snap _player.velX = _snap
			_player.velXOff = -_snap
			with _player {
				x += _snap
				var _death = checkOverlap(x,y,obj_solid)
				if _death != noone and instance_exists(_death) {
					playerDeath()
				}
			}
		}
		if _velX < 0
		{
			var _snap = BboxLeft(self)-BboxRight(_player)
			if _player.velX > _snap _player.velX = _snap
			_player.velXOff = -_snap
			with _player {
				x += _snap
				var _death = checkOverlap(x,y,obj_solid)
				if _death != noone and instance_exists(_death) {
					playerDeath()
				}
			}
		}
	}
	
	y += _amtY
	var _velY = y-yprevious
	var _player = checkOverlap(x,y,obj_player)
	if _player != noone { // pushing the player
		if _velY < 0 {
			var _snap = BboxTop(self)-BboxBottom(_player)
			if _player.velY > _snap _player.velY = _snap
			_player.velYOff = -_snap
			with _player {
				y += _snap
				var _death = checkOverlap(x,y,obj_solid)
				if _death != noone and instance_exists(_death) {
					playerDeath()
				}
			}
		}
		if _velY > 0 {
			var _snap = BboxBottom(self)-BboxTop(_player)
			if _player.velY < _snap _player.velY = _snap
			_player.velYOff = -_snap
			with _player {
				y += _snap
				var _death = checkOverlap(x,y,obj_solid)
				if _death != noone and instance_exists(_death) {
					playerDeath()
				}
			}
		}
	}
}

function playerDeath() {
	if instance_exists(obj_checkpoint) {
		var _pd = instance_create_layer(x,y,"Player",obj_playerDeath)
		var _dir = point_direction(0,0,velX,velY)
		if point_distance(0,0,_pd.velX,_pd.velY) != 0 {
			_pd.velX = lengthdir_x(-3.5,_dir)
			_pd.velY = lengthdir_y(-3.5,_dir)
		}
		_pd.image_xscale = sign(image_xscale)
		instance_destroy()
	}
}