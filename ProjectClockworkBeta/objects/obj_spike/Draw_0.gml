for(i=0;i<spikeNum;i++) {
	var _xdraw = x + xDrawDir * (floor(spikeNum/2)-i)*8
	var _ydraw = y + yDrawDir * (floor(spikeNum/2)-i)*8
	draw_sprite_ext(spr_spike,0,_xdraw,_ydraw,1,1,image_angle,c_white,1)
}