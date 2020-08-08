draw_set_font(ft_text)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(itemColor)

if !global.gameControls {
	draw_text(x-48,y-52,"Menu Controls: \n"+
				  "W, S: Choose selection\n"+
				  "Enter: Select")
				  /*"Game Controls: \n"+
				  "A, D: Left, Right\n"+
				  "K: Jump\n"+
				  "J: Rewind Clock\n"+
				  "Escape: Pause\n"+
				  "[2]: Skip Level")*/
} else {
	draw_text(x-48,y-52,"Game Controls: \n"+
						"A, D: Left, Right\n"+
						"K: Jump\n"+
						"J: Rewind Clock\n"+
						"Esc: Pause\n"+
						"Hold 2: Skip Level (:")
}