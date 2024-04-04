extends Node2D

@onready var animation = $Fundo
func _process(_delta):
	if not LogicGlobals.chico_already_seen_sagui:
		animation.play("default")
	else:
		animation.stop()
		visible = false
	
