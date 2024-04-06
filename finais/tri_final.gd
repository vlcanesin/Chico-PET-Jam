extends Node2D

func _ready():
	LogicGlobals.in_tri_final = true
	MusicController.play_music(true)
