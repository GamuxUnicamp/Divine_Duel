extends Node

const BULLET_DURATION = 5 #reduce to increase speed. increse to reduce speed
const BULLET_MAX_DISTANCE = 2267 #2203 is the greates distance that can be corssed on a 1920x1080px screen + 64 pixels for fitting a big sprite. Changing this const will affect the speed of all bullets in the game.
const CHAR_SPEED = 400

var character_select_mode #0 for Arcade, 1 for VS Player, 2 for VS COM, 3, for Training

var player1_pos = Vector2()
var player2_pos = Vector2()


func _ready():
	pass # Replace with function body.
