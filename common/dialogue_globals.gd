extends Node

var in_dialogue: bool = false
var walter_speak: bool = false   # npc_1
var jao_speak: bool = false      # npc_1.2
var claudio_diniz_speak: bool = false # claudio diniz(npc_2)
var luigi_speak: bool = false    # npc_3
var rosa_speak: bool = false     # npc_4
var marcelo_speak: bool = false  # npc_5 
var vivi_speak: bool = false     # npc_6
var fernando_speak: bool = false
var fabricio_speak: bool = false
var cibele_speak: bool = false
var beatriz_speak: bool = false

var guardinha_speak: bool = false	 # guardinha

var bernardo_should_run: bool = false

func switch_dialogue(speakers):
	assert(typeof(speakers) == typeof([]), "switch_dialogue() only accepts lists!")
	assert(speakers.size() == 2, "switch_dialogue() only accepts lists of size 2!")
	speakers[0] = not speakers[0]
	speakers[1] = not speakers[1]
