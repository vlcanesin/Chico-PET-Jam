extends Area2D

@export var scene_path = ""
@export var direction = ""
@export var new_position: Vector2 = Vector2(0,0)

func action():
	LogicGlobals.chico_start_position = new_position
	get_tree().change_scene_to_file(scene_path)
	
func get_thought():
	return direction
