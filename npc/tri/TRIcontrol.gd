extends Node2D

const SPEED = 500.0

@onready var TRI = $TRI

var follows_sagui: bool = false
var dist_traveled: float = 0.0

var grow: bool = false

func _ready():
	if LogicGlobals.chico_iswith_tri:
		position.y = 10000

func _process(delta):
	if follows_sagui:
		var dx = SPEED*delta
		position.x -= dx
		dist_traveled += dx
		if dist_traveled > 1300:
			follows_sagui = false
			grow = true
	if is_instance_valid(TRI):
		if grow:
			TRI.scale.x = 1
			TRI.scale.y = 1
		else:
			TRI.scale.x = 0.3
			TRI.scale.y = 0.3

func _on_collision_actionable_collision():
	follows_sagui = true

func _on_npctri_arrived_at_tri():
	position.y = 10000

func _on_tri_area_entered(area):
	LogicGlobals.chico_iswith_tri = true
