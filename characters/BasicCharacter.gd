extends KinematicBody2D

onready var basic_bullet_scene = load("res://bullets/BasicBullet.tscn")
onready var timer0 = $AttackTimer0
onready var timer1 = $AttackTimer1
onready var timer2 = $AttackTimer2
onready var timer3 = $AttackTimer3

var velocity = Vector2()

func get_input():
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
		aim_shot(Global.player2_pos)
		timer0.start()
	if Input.is_action_pressed("attack1") and timer1.get_time_left() == 0:
		wide_shot(Global.player2_pos)
		timer1.start()
	if Input.is_action_pressed("attack2") and timer2.get_time_left() == 0:
		aim_shot(Global.player2_pos)
		timer2.start()
	

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func aim_shot(target):
	var bullet = basic_bullet_scene.instance()
	bullet.position = self.position
	get_tree().get_root().add_child(bullet)
	bullet.move(target)

func wide_shot(target):
	var bullet0 = basic_bullet_scene.instance()
	var bullet1 = basic_bullet_scene.instance()
	var bullet2 = basic_bullet_scene.instance()
	var bullet3 = basic_bullet_scene.instance()
	var bullet4 = basic_bullet_scene.instance()
	var bullet5 = basic_bullet_scene.instance()
	var bullet6 = basic_bullet_scene.instance()
	var bullet7 = basic_bullet_scene.instance()
	bullet0.position = self.position
	bullet1.position = self.position
	bullet2.position = self.position
	bullet3.position = self.position
	bullet4.position = self.position
	bullet5.position = self.position
	bullet6.position = self.position
	bullet7.position = self.position
	get_tree().get_root().add_child(bullet0)
	get_tree().get_root().add_child(bullet1)
	get_tree().get_root().add_child(bullet2)
	get_tree().get_root().add_child(bullet3)
	get_tree().get_root().add_child(bullet4)
	get_tree().get_root().add_child(bullet5)
	get_tree().get_root().add_child(bullet6)
	get_tree().get_root().add_child(bullet7)
	bullet0.move(position+Vector2(-1,-1))
	bullet1.move(position+Vector2(-1,0))
	bullet2.move(position+Vector2(-1,1))
	bullet3.move(position+Vector2(0,-1))
	bullet4.move(position+Vector2(0,1))
	bullet5.move(position+Vector2(1,-1))
	bullet6.move(position+Vector2(1,0))
	bullet7.move(position+Vector2(1,1))
	
