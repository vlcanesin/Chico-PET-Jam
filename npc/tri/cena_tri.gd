extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func _on_collision_actionable_collision():
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
