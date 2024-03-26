extends CharacterBody2D

const SPEED = 200.0

@onready var _walk_sprite = $WalkSprite

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/dialogue_text.dialogue"), "start")

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		_walk_sprite.play("right")
		position.x += SPEED*delta
	elif Input.is_action_pressed("ui_left"):
		_walk_sprite.play("left")
		position.x -= SPEED*delta
	else:
		_walk_sprite.stop()
