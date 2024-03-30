extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
@export var trigger_thought: String = ""

#signal speak

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	#speak.emit()

func get_trigger_thought() -> String:
	return trigger_thought
