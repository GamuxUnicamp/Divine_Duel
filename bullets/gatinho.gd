extends Area2D

var fonte=null
var SPEED=300
func start(source,start_position):
	position=start_position
	fonte=source
	$AnimationPlayer.play("New Anim")

func _physics_process(delta):
	if fonte!=null and $Timer.is_stopped():
		var direction=(fonte.position-position).normalized()
		position+=direction*SPEED*delta
		rotation=direction.angle()
		if direction.x<0:
			
			$Sprite.flip_v=true
		else:
			
			$Sprite.flip_v=false

func _on_Area2D_body_entered(body):
	if body and body!=fonte and body.has_method("hit") and $Timer.is_stopped():
		body.hit()
		queue_free()
	elif body==fonte:
		queue_free()
