extends KinematicBody2D


onready var moving="parado"
var startposition
var endposition
var RETURN_SPEED
var MAX_ADVANCE_SPEED
var fonte
# Called when the node enters the scene tree for the first time.
func move(source,target):
	fonte=source
	if moving=="parado":
		moving="indo"
		startposition=source.position
		endposition=target.position+(target.position-source.position)*1.1
	elif moving=="indo":
		moving="voltando"
	
func _physics_process(delta):
	var velocity
	var percentual
	if moving=="indo":
		percentual=(position-startposition).length()/(endposition-startposition).length()
		velocity=MAX_ADVANCE_SPEED*sin(percentual*PI)*((endposition-startposition).normalized())
	elif moving=="voltando":
		velocity=RETURN_SPEED*((fonte.position-position).normalized())
	var collision=move_and_collide(velocity*delta)
	if collision!=null:
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			queue_free()
	if moving=="indo" and percentual>=1:
		moving="voltando"
		
	
	
