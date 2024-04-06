extends Node2D

func _process(_delta):
	if LogicGlobals.dogfight_is_running and not LogicGlobals.calc_study_completed:
		position.y = 418
	else:
		position.y = 10000

func _on_anton_area_entered(area):
	LogicGlobals.calc_study_completed = true
