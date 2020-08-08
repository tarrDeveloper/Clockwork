menuItems = ds_list_create()
ds_list_add(menuItems,"Start")
ds_list_add(menuItems,"Game Controls")
ds_list_add(menuItems,"Volume")
ds_list_add(menuItems,"Enable Speedrun")
ds_list_add(menuItems,"Clear Time")
ds_list_add(menuItems,"Exit")

maxSelection = ds_list_size(menuItems)-1
currentSelection = 0

selectTimer = 45
selectAlpha = 1
selected = -1

itemColor = make_color_rgb(189,204,187)
timeColor = make_color_rgb(34,35,35)

global.speedRun = false
global.gameControls = false

// gui
display_set_gui_size(320,180)

// speedrun
ini_open("speedrun.ini")
var _bestTime = ini_read_real("times","best",0)
ini_close()

var _minutes = floor(_bestTime/3600)
var _seconds = floor(((_bestTime)-(_minutes*3600))/60)
var _mili    = floor(( (_bestTime)-(_minutes*3600)-(_seconds*60) )/6)

minuteString = string(_minutes)
if _minutes < 10 minuteString = "0"+minuteString

secondString = string(_seconds)
if _seconds < 10 secondString = "0"+secondString

miliString   = string(_mili)
if _mili < 10    miliString = "0"+miliString