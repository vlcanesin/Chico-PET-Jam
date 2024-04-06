extends Node2D

func _process(_delta):
	if LogicGlobals.calc_study_completed and LogicGlobals.calc_pencil_completed:
		position.y = 370
	else:
		position.y = 10000
	if LogicGlobals.in_calc_final:
		get_tree().change_scene_to_file("res://finais/calc_final.tscn")
