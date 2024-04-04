extends Node2D

@onready var animation = $Fundo
func _process(_delta):
	if not LogicGlobals.chico_already_ALGOAQUI:
		animation.play("vucovuco")
	else:
		animation.stop()
		visible = false
	
