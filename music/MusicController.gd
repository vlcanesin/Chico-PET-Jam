extends Node2D

var menu_music = load("res://assets/sfx/menu_song.wav")
var main_music = load("res://assets/sfx/ChicoProductions_finale_topper.wav")
var calc_song = load("res://assets/sfx/calc_song.wav")
var montanha_song = load("res://assets/sfx/montanha_song.wav")
var tri_song = load("res://assets/sfx/tri_song.wav")
var mimir_sound = load("res://assets/sfx/sleep.wav")
var player_stream
var only_once: bool = false

func play_music(stop_forever = false):
	if LogicGlobals.in_menu:
		player_stream = menu_music
	else:
		if LogicGlobals.in_calc_final:
			player_stream = calc_song
		elif LogicGlobals.in_montanha_final:
			player_stream = montanha_song
		elif LogicGlobals.in_tri_final:
			player_stream = tri_song
		elif LogicGlobals.in_mimir_final:
			player_stream = mimir_sound
		else:
			player_stream = main_music
	
	if not only_once:	
		$Player.stream = player_stream
		$Player.play()
		only_once = stop_forever

func _on_player_finished():
	play_music()
