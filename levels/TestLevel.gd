extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Character.player_number = 1
	$Bastet_1.target = $Target


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
