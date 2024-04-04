extends Node2D

const SPEED = 500.0

var follows_sagui: bool = false
var dist_traveled: float = 0.0

var grow: bool = false

func _process(delta):
	if follows_sagui:
		var dx = SPEED*delta
		position.x -= dx
		dist_traveled += dx
		if dist_traveled > 1300:
			follows_sagui = false
			grow = true
	if grow:
		scale.x = 1
		scale.y = 1
	else:
		scale.x = 0.3
		scale.y = 0.3

func _on_collision_actionable_collision():
	follows_sagui = true

func _on_npctri_arrived_at_tri():
	position.y = 10000
