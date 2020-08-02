// these functions get the bounding box parts of an entity
function BboxRight(_ent)  {return _ent.x+_ent.bboxRightLen}
function BboxLeft(_ent)   {return _ent.x-_ent.bboxLeftLen}
function BboxTop(_ent)    {return _ent.y-_ent.bboxTopLen}
function BboxBottom(_ent) {return _ent.y+_ent.bboxBottomLen}

// these function check if an entity is overlapping a certain object
function checkOverlap(_x,_y,_objectType) {
	var _myBboxRight  = _x+bboxRightLen
	var _myBboxLeft   = _x-bboxLeftLen
	var _myBboxTop    = _y-bboxTopLen
	var _myBboxBottom = _y+bboxBottomLen
	
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
		} else {
			x += BboxRight(_col)-BboxLeft(self)
		}
		velX = _col.velX
		return _col
	}
	return noone
}

function ActorMoveY(_amt) {
	y += _amt
	var _col = checkOverlap(x,y,obj_solid)
	if _col != noone {
		if _amt > 0 {
			y += BboxTop(_col)-BboxBottom(self)
		} else {
			y += BboxBottom(_col)-BboxTop(self)
		}
		velY = _col.velY
		return _col
	}
	return noone
}

// this function moves a solid and pushes actors
function SolidMove(_amtX,_amtY) {
	x += _amtX
	y += _amtY
	
	var _velX = x-xprevious
	var _velY = y-yprevious
	
	var _player = checkOverlap(x,y,obj_player)
	if _player != noone { // pushing the player
		if _velX > 0 _player.velX = max(_player.velX,BboxRight(self)-BboxLeft(_player))
		if _velX < 0 _player.velX = min(_player.velX,BboxLeft(self)-BboxRight(_player))
		if _velY < 0 _player.velY = min(_player.velY,BboxTop(self)-BboxBottom(_player))
		if _velY > 0 _player.velY = max(_player.velY,BboxBottom(self)-BboxTop(_player))
	}
}