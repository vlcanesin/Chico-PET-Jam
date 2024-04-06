extends Node2D

func _process(_delta):
	if LogicGlobals.chico_iswith_key and not LogicGlobals.water_completed:
		position.y = -100
	else:
		position.y = 10000

func _on_agua_area_entered(area):
	LogicGlobals.water_completed = true
