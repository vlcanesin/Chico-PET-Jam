extends Node2D

func _process(_delta):
	if LogicGlobals.chico_already_seen_sagui:
		visible = true
	else:
		visible = false
