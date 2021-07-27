extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.demo_player_won == 1:
		$Vencedor.text = "Vencedor: Jogador 1"
	else:
		$Vencedor.text = "Vencedor: Jogador 2"


func _on_BotaoVoltar_button_down():
	get_tree().change_scene("res://menus/MainMenu.tscn")
