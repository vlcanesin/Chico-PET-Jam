extends Node2D

func _process(delta):
	if LogicGlobals.dogfight_is_running:
		queue_free()
