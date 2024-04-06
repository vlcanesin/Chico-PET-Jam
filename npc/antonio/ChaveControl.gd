extends Node2D

var has_barked: bool = false

func _process(_delta):
	if LogicGlobals.unlock_water and has_barked:
		position.y = 100
	else:
		pass
		position.y = 10000

func _on_actionable_heard_bark():
	has_barked = true

func _on_chave_area_entered(area):
	LogicGlobals.chico_iswith_key = true
