extends Node2D

@onready var animation = $Fundo
#@onready var foi_MIJADO = false

func _process(_delta):
	if not LogicGlobals.chico_already_ALGOAQUI:
		animation.play("vucovuco")		
	
func _on_actionable_felt_pee():
	LogicGlobals.chico_already_ALGOAQUI = true
	get_tree().call_group("multidao_escada", "disappear")
	
func disappear():
	animation.stop()
	visible = false
	process_mode = Node.PROCESS_MODE_DISABLED
