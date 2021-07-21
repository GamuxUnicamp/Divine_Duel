extends Area2D


var RADIAL_SPEED=90
var OMEGA=PI/2
var R
var teta
var sentido
var fonte
onready var ready=false
func move(source,R0,teta0,direction):
	R=R0
	teta=teta0
	sentido=direction
	fonte=source
	position=Vector2(R*cos(teta),R*sin(teta))
	ready=true
	$Line2D.add_point(Vector2(0,0))
	$Line2D.add_point(-1*position)


func _physics_process(delta):
	R-=RADIAL_SPEED*delta
	teta+=OMEGA*delta*sentido
	position=Vector2(R*cos(teta),R*sin(teta))
	if fonte:
		$Line2D.set_point_position(1,-1*position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BastetIoio2_body_entered(body):
	if body!=fonte and body.has_method("hit"):
		body.hit()
		queue_free()
	elif body==fonte and ready:
		queue_free()
		pass
