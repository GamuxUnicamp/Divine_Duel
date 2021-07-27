extends "res://characters/BasicCharacter.gd"

onready var wide_bullet_scene=load("res://bullets/BastetIoio2.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal died
enum ioio {NENHUM,INDO,VOLTANDO}
var tem_ioio=ioio.NENHUM
var bullet
var wide_bullet
var wide_bullet2
var R=500
var teta=PI/4
export var id=0
func _ready():
	basic_bullet_scene = load("res://bullets/BastetIoio.tscn")

func aim_shot(target):
	if tem_ioio==ioio.NENHUM or bullet==null:
		bullet = basic_bullet_scene.instance()
		bullet.position = self.position
		get_tree().get_root().add_child(bullet)
		bullet.move(self,target)
		tem_ioio=ioio.INDO
	elif tem_ioio==ioio.INDO:
		bullet.move(self,target)
		tem_ioio=ioio.VOLTANDO

func wide_shot(target):
	wide_bullet = wide_bullet_scene.instance()
	add_child(wide_bullet)
	wide_bullet2 = wide_bullet_scene.instance()
	add_child(wide_bullet2)
	var angle=get_angle_to(target)
	wide_bullet.move(self,R,angle+teta,-1)
	wide_bullet2.move(self,R,angle-teta,1)
	add_child(wide_bullet)
	add_child(wide_bullet2)

func receive():
	tem_ioio=ioio.NENHUM

func hit():
	$AnimationPlayer.play("damage")
	emit_signal("died",id)
