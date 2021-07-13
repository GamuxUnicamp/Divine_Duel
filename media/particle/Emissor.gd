extends Node2D


onready var p=preload("res://media/particle/Particle.tscn")
var n=15
var counter=0
var objeto=null
signal sinal
# Called when the node enters the scene tree for the first time.
func start(object):
	var direction=Vector2(1,0)
	randomize()
	var a=rand_range(0,2*PI)
	for i in range(n):
		var particle=p.instance()
		add_child(particle)
		
		particle.start(direction.rotated(a+i*2*PI/n))
	

func tween_finished():
	counter+=1
	if counter==n:
		emit_signal("sinal")
		counter=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
