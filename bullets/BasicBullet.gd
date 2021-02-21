extends Area2D

onready var move_tween = $Tween

func _ready():
	move_tween.connect("tween_all_completed",self,"on_tween_completed")
	pass

func move(target):
	move_tween.interpolate_property(self,"position", position, position+position.direction_to(target)*Global.BULLET_MAX_DISTANCE, Global.BULLET_DURATION,Tween.TRANS_LINEAR )
	move_tween.start()

func on_tween_completed():
	queue_free()
