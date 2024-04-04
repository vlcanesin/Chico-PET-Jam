extends Node2D

const SPEED: float = 300.0

signal arrived_at_tri

@onready var sprite = $AnimatedSprite2D

var animation_state: String = "idle"
var dist_traveled: float = 0.0

func _process(delta):
	if DialogueGlobals.bernardo_should_run:
		animation_state = "run"
		var dx = SPEED*delta
		position.x -= dx
		dist_traveled += dx
		if dist_traveled > 1300:
			DialogueGlobals.bernardo_should_run = false
			arrived_at_tri.emit()
	else:
		animation_state = "idle"
	sprite.play(animation_state)
