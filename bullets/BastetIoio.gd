extends Area2D


onready var moving="parado"
var startposition
var endposition
var MAX_RETURN_SPEED=1500
var MIN_RETURN_SPEED=100
var MAX_ADVANCE_SPEED=1500
var MIN_ADVANCE_SPEED=100
var fonte
var saiu=false
# Called when the node enters the scene tree for the first time.
func move(source,target):
	fonte=source
	if moving=="parado":
		moving="indo"
		startposition=source.position
		endposition=source.position+(target-source.position)*1.1
		$Line2D.add_point(Vector2(0,0))
		$Line2D.add_point(source.position-position)
	elif moving=="indo":
		moving="voltando"
		startposition=position
func _physics_process(delta):
	var velocity
	var percentual
	if moving=="indo":
		
		percentual=(position-startposition).length()/(endposition-startposition).length()
		velocity=max(MAX_ADVANCE_SPEED*cos(PI/2*percentual),MIN_ADVANCE_SPEED)*((endposition-startposition).normalized())
		if fonte:
			$Line2D.set_point_position(1,fonte.position-position)
	elif moving=="voltando":
		percentual=(position-startposition).length()/(fonte.position-startposition).length()
		velocity=max(MAX_RETURN_SPEED*sin(PI/2*percentual),MIN_RETURN_SPEED)*((fonte.position-position).normalized())
		if fonte:
			
			$Line2D.set_point_position(1,fonte.position-position)
	else:
		velocity=Vector2(0,0)
		print("parado")
		
	position+=velocity*delta
	
	if moving=="indo" and percentual>=1:
		moving="voltando"
		startposition=position
		
		
		
	
	


func _on_BastetIoio_body_entered(body):
	if body!=fonte and body.has_method("hit") :
		body.hit()
		queue_free()
	elif body==fonte and body.has_method("receive") and saiu:
		body.receive()
		queue_free()


func _on_BastetIoio_body_exited(body):
	if body==fonte:
		saiu=true
