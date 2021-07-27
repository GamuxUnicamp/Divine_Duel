#extends "res://characters/Character.gd"
extends KinematicBody2D

onready var wide_bullet_scene=load("res://bullets/BastetIoio2.tscn")

enum ioio {NENHUM,INDO,VOLTANDO}
var tem_ioio=ioio.NENHUM
var bullet
var wide_bullet
var wide_bullet2
var R=500
var teta=PI/4
export var id=0

var target

onready var basic_bullet_scene = load("res://bullets/BastetIoio.tscn")
onready var timer0 = $AttackTimer0
onready var timer1 = $AttackTimer1
onready var timer2 = $AttackTimer2
onready var timer3 = $AttackTimer3

var velocity = Vector2()
var player_number

func _ready():
	basic_bullet_scene = load("res://bullets/BastetIoio.tscn")

func get_input1():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * Global.CHAR_SPEED
	if Input.is_action_pressed("attack0") and timer0.get_time_left() == 0:
		aim_shot(target)
		timer0.start()
	if Input.is_action_pressed("attack1") and timer1.get_time_left() == 0:
		wide_shot(target)
		timer1.start()

func get_input2():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right_p2"):
		velocity.x += 1
	if Input.is_action_pressed('ui_left_p2'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down_p2'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up_p2'):
		velocity.y -= 1
	velocity = velocity.normalized() * Global.CHAR_SPEED
	if Input.is_action_pressed("attack0_p2") and timer0.get_time_left() == 0:
		aim_shot(target)
		timer0.start()
	if Input.is_action_pressed("attack1_p2") and timer1.get_time_left() == 0:
		wide_shot(target)
		timer1.start()

func _physics_process(delta):
	if player_number == 1:
		get_input1();
	elif player_number == 2:
		get_input2();
	velocity = move_and_slide(velocity)

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
	if player_number == 1:
		Global.demo_player_won = 2
	if player_number == 2:
		Global.demo_player_won = 1
	get_tree().change_scene("res://levels/DemoGameOver.tscn")
