if x > xDraw {
	xDraw = floor(x*2)/2
} else {
	xDraw = ceil(x*2)/2
}

if y > yDraw {
	yDraw = floor(y*2)/2
} else {
	yDraw = ceil(y*2)/2
}

draw_sprite_ext(sprite_index,image_index,xDraw,yDraw-sprite_height*(image_yscale-1),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
//draw_rectangle(x-bboxLeftLen,y-bboxTopLen,x+bboxRightLen,y+bboxBottomLen,true)