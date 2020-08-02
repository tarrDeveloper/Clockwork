var _roundTo = 1
if x > xDraw {
	xDraw = floor(x*_roundTo)/_roundTo
} else {
	xDraw = ceil(x*_roundTo)/_roundTo
}

if y > yDraw {
	yDraw = floor(y*_roundTo)/_roundTo
} else {
	yDraw = ceil(y*_roundTo)/_roundTo
}

draw_sprite_ext(sprite_index,image_index,x,y-sprite_height*(image_yscale-1),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
//draw_rectangle(x-bboxLeftLen,y-bboxTopLen,x+bboxRightLen,y+bboxBottomLen,true)