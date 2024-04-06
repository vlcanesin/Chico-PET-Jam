extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
@export var trigger_thought: String = ""

func action() -> void:
	if not LogicGlobals.unlock_calc_study:
		dialogue_start = "without_calc"
	else:
		dialogue_start = "start"
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	#speak.emit()

func get_thought() -> String:
	return trigger_thought
