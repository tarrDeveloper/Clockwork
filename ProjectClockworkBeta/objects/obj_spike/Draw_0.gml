var _xdraw = x
var _ydraw = y

if myClock != noone {
	for(i=0;i<spikeNum;i++) {
		_xdraw = xLock + xDrawDir * (spikeNum/2-i-.5)*8
		_ydraw = yLock + yDrawDir * (spikeNum/2-i-.5)*8
		draw_sprite_ext(spr_spike,1,_xdraw,_ydraw,1,1,image_angle,c_white,1)
	}
}

for(i=0;i<spikeNum;i++) {
	_xdraw = x + xDrawDir * (spikeNum/2-i-.5)*8
	_ydraw = y + yDrawDir * (spikeNum/2-i-.5)*8
	draw_sprite_ext(spr_spike,0,_xdraw,_ydraw,1,1,image_angle,c_white,1)
}