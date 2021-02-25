extends Node2D

onready var selected_option = 0 #0 is unselected. 1 to 6 are main options

onready var arcade_button = $ArcadeButton
onready var versus_button = $VersusButton
onready var network_button = $NetworkButton
onready var extras_button = $ExtrasButton
onready var options_button = $OptionsButton
onready var quit_button = $QuitButton

onready var ui_move_timer = $UIMoveTimer
onready var selector = $Selector

func _ready():
	arcade_button.connect("button_down",self,"arcade_button_down")
	versus_button.connect("button_down",self,"versus_button_down")
	network_button.connect("button_down",self,"network_button_down")
	extras_button.connect("button_down",self,"extras_button_down")
	options_button.connect("button_down",self,"options_button_down")
	quit_button.connect("button_down",self,"quit_button_down")
	
	arcade_button.connect("mouse_entered",self,"mouse_entered_menu",[1])
	versus_button.connect("mouse_entered",self,"mouse_entered_menu",[2])
	network_button.connect("mouse_entered",self,"mouse_entered_menu",[3])
	extras_button.connect("mouse_entered",self,"mouse_entered_menu",[4])
	options_button.connect("mouse_entered",self,"mouse_entered_menu",[5])
	quit_button.connect("mouse_entered",self,"mouse_entered_menu",[6])

func _physics_process(delta):
	if Input.is_action_pressed("ui_up") and ui_move_timer.time_left == 0:
		match selected_option:
			0,1:
				selected_option = 6
			2,3,4,5,6:
				selected_option -= 1
		ui_move_timer.start()
	if Input.is_action_pressed("ui_down") and ui_move_timer.time_left == 0:
		match selected_option:
			0,6:
				selected_option = 1
			1,2,3,4,5:
				selected_option += 1
		ui_move_timer.start()

func _process(delta):
	if selected_option == 0:
		selector.visible = false
	else:
		selector.position = Vector2(0,32+(selected_option-1)*80)
		selector.visible = true
	#resets default color
	arcade_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	versus_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	network_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	extras_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	options_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	quit_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	if selected_option == 1:
		arcade_button.get_child(0).add_color_override("font_color",Color(0,0,0))
	elif selected_option == 2:
		versus_button.get_child(0).add_color_override("font_color",Color(0,0,0))
	elif selected_option == 3:
		network_button.get_child(0).add_color_override("font_color",Color(0,0,0))
	elif selected_option == 4:
		extras_button.get_child(0).add_color_override("font_color",Color(0,0,0))
	elif selected_option == 5:
		options_button.get_child(0).add_color_override("font_color",Color(0,0,0))
	elif selected_option == 6:
		quit_button.get_child(0).add_color_override("font_color",Color(0,0,0))

func arcade_button_down():
	pass

func versus_button_down():
	pass

func network_button_down():
	pass

func extras_button_down():
	pass

func options_button_down():
	pass

func quit_button_down():
	get_tree().quit()

func mouse_entered_menu(button):
	selected_option = button

