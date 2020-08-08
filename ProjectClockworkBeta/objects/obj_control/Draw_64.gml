// speedRunTimer
if speedRunEnable {
	draw_set_font(ft_zero)
	draw_set_halign(fa_middle)
	draw_set_valign(fa_top)

	var _minutes     = string(speedRunMinutes)
	var _seconds     = string(speedRunSeconds)
	var _miliseconds = string(floor(speedRunMiliseconds/6))

	if floor(speedRunMiliseconds/6) < 10 _miliseconds = "0"+_miliseconds
	if speedRunSeconds < 10 _seconds = "0"+_seconds
	if speedRunMinutes < 10 _minutes = "0"+_minutes


	draw_text(160,-2,_minutes+":"+_seconds+"."+_miliseconds)
}

// level skip
draw_sprite(spr_levelSkip,roomChangeTime,296,156)