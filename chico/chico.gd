extends CharacterBody2D

const SPEED = 200.0

@onready var _walk_sprite = $WalkSprite
@onready var actionable_finder: Area2D = $ActionableFinder

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		_walk_sprite.play("right")
		position.x += SPEED*delta
	elif Input.is_action_pressed("ui_left"):
		_walk_sprite.play("left")
		position.x -= SPEED*delta
	else:
		_walk_sprite.stop()
