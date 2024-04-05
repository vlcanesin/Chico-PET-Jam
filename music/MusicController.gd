extends Node2D

var menu_music = load("res://assets/sfx/menu_song.wav")
var main_music = load("res://assets/sfx/ChicoProductions_finale_topper.wav")
var calc_song = load("res://assets/sfx/calc_song.wav")
var montanha_song = load("res://assets/sfx/montanha_song.wav")
var tri_song = load("res://assets/sfx/tri_song.wav")
var player_stream
var play_once = 0

func play_music():
	if LogicGlobals.in_menu:
		player_stream = menu_music
	else:
		if LogicGlobals.in_calc_final:
			player_stream = calc_song
			play_once += 1
		elif LogicGlobals.in_montanha_final:
			player_stream = montanha_song
			play_once += 1
		elif LogicGlobals.in_tri_final:
			player_stream = tri_song
			play_once += 1
		else:
			player_stream = main_music
	
	if play_once <= 1:		
		$Player.stream = player_stream
		$Player.play()

func _on_player_finished():
	play_music()
