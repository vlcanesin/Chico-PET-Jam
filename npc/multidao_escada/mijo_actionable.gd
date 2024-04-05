extends Area2D

@export var trigger_thought: String = ""

signal felt_pee

func action() -> void:
	felt_pee.emit()

func only_in_pee():
	pass

func get_thought() -> String:
	return trigger_thought
