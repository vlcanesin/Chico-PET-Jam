extends Node

var in_dialogue: bool = false
var walter_speak: bool = false   # npc_1
var marcelo_speak: bool = false  # npc_5   

func switch_dialogue(speakers):
	assert(typeof(speakers) == typeof([]), "switch_dialogue() only accepts lists!")
	assert(speakers.size() == 2, "switch_dialogue() only accepts lists of size 2!")
	speakers[0] = not speakers[0]
	speakers[1] = not speakers[1]
