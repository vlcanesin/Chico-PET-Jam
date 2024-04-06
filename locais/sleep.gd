extends Area2D

func action():
	LogicGlobals.in_mimir_final = true
	MusicController.play_music(true)
	get_tree().change_scene_to_file("res://finais/mimir_final.tscn")
