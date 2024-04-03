extends Area2D

@export var scene_path = ""
@export var direction = ""

func action():
	get_tree().change_scene_to_file(scene_path)
	
func get_thought():
	return direction
