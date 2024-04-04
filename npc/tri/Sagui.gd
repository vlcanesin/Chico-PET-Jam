extends Node2D

const SPEED = 500.0

@onready var sagui_spr: AnimatedSprite2D = $AnimatedSprite2D

var runs_to_the_left: bool = false
var returns: bool = false
var animation_state: String = "idle"
var dist_traveled: float = 0.0

func _process(delta):
	if runs_to_the_left:
		animation_state = "run"
		var dx = SPEED*delta
		position.x -= dx
		dist_traveled += dx
		if dist_traveled > 1000:
			runs_to_the_left = false
	else:
		animation_state = "idle"
	sagui_spr.play(animation_state)

func _on_collision_actionable_collision():
	runs_to_the_left = true
	dist_traveled = 0
