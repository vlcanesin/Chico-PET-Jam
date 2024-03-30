extends Node

signal start_dialogue
signal end_dialogue

func _ready():
	set_process(false)

func startDialogue():
	print("Chamei startDialogue")
	start_dialogue.emit()

func endDialogue():
	print("Chamei endDialogue")
	end_dialogue.emit()
