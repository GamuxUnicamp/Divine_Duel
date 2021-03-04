extends Node2D

onready var selection_level = 0 #0 for first column, 1 versus, 2 for third.
onready var selected_option = 0 #0 is unselected. 1 to 6 are main options
onready var selected_option_versus = 0

onready var arcade_button = $ArcadeButton
onready var versus_button = $VersusButton
onready var online_button = $OnlineButton
onready var extras_button = $ExtrasButton
onready var options_button = $OptionsButton
onready var quit_button = $QuitButton

onready var vs_player_button = $VersusPanel/VSPlayerButton
onready var vs_com_button = $VersusPanel/VSCOMButton
onready var training_button = $VersusPanel/TrainingButton

onready var selector = $Selector
#onready var selector_versus = $VersusPanel/Selector
onready var ui_move_timer = $UIMoveTimer
onready var ui_move_sound = $UIMoveSound
onready var ui_select_sound = $UISelectSound

onready var versus_panel = $VersusPanel

func _ready():
	arcade_button.connect("button_down",self,"arcade_button_down")
	versus_button.connect("button_down",self,"versus_button_down")
	online_button.connect("button_down",self,"online_button_down")
	extras_button.connect("button_down",self,"extras_button_down")
	options_button.connect("button_down",self,"options_button_down")
	quit_button.connect("button_down",self,"quit_button_down")
	
	vs_player_button.connect("button_down",self,"vs_player_button_down")
	vs_com_button.connect("button_down",self,"vs_com_button_down")
	training_button.connect("button_down",self,"training_button_down")
	
	arcade_button.connect("mouse_entered",self,"mouse_entered_menu",[1])
	versus_button.connect("mouse_entered",self,"mouse_entered_menu",[2])
	online_button.connect("mouse_entered",self,"mouse_entered_menu",[3])
	extras_button.connect("mouse_entered",self,"mouse_entered_menu",[4])
	options_button.connect("mouse_entered",self,"mouse_entered_menu",[5])
	quit_button.connect("mouse_entered",self,"mouse_entered_menu",[6])

func _physics_process(delta):
	if selection_level == 0:
		if Input.is_action_pressed("ui_up") and ui_move_timer.time_left == 0:
			ui_move_sound.play()
			match selected_option:
				0,1:
					selected_option = 6
				2,3,4,5,6:
					selected_option -= 1
			ui_move_timer.start()
		elif Input.is_action_pressed("ui_down") and ui_move_timer.time_left == 0:
			ui_move_sound.play()
			match selected_option:
				0,6:
					selected_option = 1
				1,2,3,4,5:
					selected_option += 1
			ui_move_timer.start()
		if Input.is_action_pressed("ui_accept"):
			ui_select_sound.play()
			match selected_option:
				1:
					arcade_button_down()
				2:
					versus_button_down()
				3:
					online_button_down()
				4:
					extras_button_down()
				5:
					options_button_down()
				6:
					quit_button_down()
	elif selection_level == 1:
		pass
	

func _process(delta):
	if selected_option == 0:
		selector.visible = false
	else:
		selector.position = Vector2(0,32+(selected_option-1)*80)
		selector.visible = true
	#resets default color
	arcade_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	versus_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	online_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	extras_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	options_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	quit_button.get_child(0).add_color_override("font_color",Color(1,1,1))
	if selection_level ==0:
		if selected_option == 1:
			arcade_button.get_child(0).add_color_override("font_color",Color(0,0,0))
		elif selected_option == 2:
			versus_button.get_child(0).add_color_override("font_color",Color(0,0,0))
		elif selected_option == 3:
			online_button.get_child(0).add_color_override("font_color",Color(0,0,0))
		elif selected_option == 4:
			extras_button.get_child(0).add_color_override("font_color",Color(0,0,0))
		elif selected_option == 5:
			options_button.get_child(0).add_color_override("font_color",Color(0,0,0))
		elif selected_option == 6:
			quit_button.get_child(0).add_color_override("font_color",Color(0,0,0))

func arcade_button_down():
	Global.character_select_mode = 0
	get_tree().change_scene("res://menus/CharacterSelect.tscn")

func versus_button_down():
	versus_panel.show()
	selection_level = 1

func online_button_down():
	pass

func extras_button_down():
	pass

func options_button_down():
	pass

func quit_button_down():
	get_tree().quit()

func vs_player_button_down():
	Global.character_select_mode = 1
	get_tree().change_scene("res://menus/CharacterSelect.tscn")

func vs_com_button_down():
	Global.character_select_mode = 2
	get_tree().change_scene("res://menus/CharacterSelect.tscn")

func training_button_down():
	Global.character_select_mode = 3
	get_tree().change_scene("res://menus/CharacterSelect.tscn")

func mouse_entered_menu(button):
	selected_option = button

#>>VERSUS
#>VS PLAYER
#>VS COM
#>TRAINING
#>BACK
#>>ONLINE
#>CREATE LOBBY
#>BROWSER LOBBIES
#>DIRECT CONECTION
#>PROFILE
#>ONLINE OPTIONS
#>BACK
#>>EXTRAS
#>MUSIC
#>GALLERY
