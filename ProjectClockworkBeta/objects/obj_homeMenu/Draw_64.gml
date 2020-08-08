draw_set_font(ft_text)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(itemColor)

draw_sprite(sprite_index,0,x,y)
var _menSize = ds_list_size(menuItems)
for(i=0;i<_menSize;i++) {
	var _item = ds_list_find_value(menuItems,i)
	draw_text(x,y+(i-_menSize/2 + .5)*16 - 1,_item)
	if currentSelection = i {
			draw_sprite_ext(spr_menuSelectHome,0,x,y+(i-_menSize/2 + .5)*16,1,1,0,itemColor,selectAlpha)
	}
}

if global.speedRun {
	draw_set_halign(fa_middle)
	draw_set_valign(fa_top)
	draw_set_color(timeColor)
	draw_text(160,8,"Best time: "+minuteString+":"+secondString+"."+miliString)
}

draw_set_color(c_white)