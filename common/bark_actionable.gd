extends Area2D

@export var trigger_thought: String = ""

signal heard_bark

func action() -> void:
	heard_bark.emit()

func get_thought() -> String:
	return trigger_thought

func only_in_bark():
	pass
