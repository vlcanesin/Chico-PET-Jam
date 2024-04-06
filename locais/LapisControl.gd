extends Node2D

func _process(_delta):
	if LogicGlobals.unlock_calc_pencil:
		position.y = 330

func _on_lapis_area_entered(area):
	LogicGlobals.calc_pencil_completed = true
