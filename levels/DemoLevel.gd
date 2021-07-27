extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Bastet_1.player_number = 1
	$Bastet_2.player_number = 2
	
	$Bastet_1.target = $Bastet_2.global_position
	$Bastet_2.target = $Bastet_1.global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$Bastet_1.target = $Bastet_2.global_position
	$Bastet_2.target = $Bastet_1.global_position
	if not has_node("Bastet_2"):
		Global.demo_player_won = 1
		get_tree().change_scene("res://levels/DemoGameOver.tscn")
	elif not has_node("Bastet_1"):
		Global.demo_player_won = 2
		get_tree().change_scene("res://levels/DemoGameOver.tscn")
