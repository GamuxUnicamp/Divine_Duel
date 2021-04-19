extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dist=200
# Called when the node enters the scene tree for the first time.
func start(direction):
	
	$Tween.interpolate_property(self, "position",Vector2(0, 0), direction*dist, 0.4,Tween.TRANS_LINEAR)
	$Tween.start()






func _on_Tween_tween_completed(object, key):
	get_parent().tween_finished()
	queue_free()
