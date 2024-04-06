extends Node2D

@onready var _sprite = $AnimatedSprite2D
var _sprite_state: String = "idle"

func _ready():
	pass 

func _process(_delta):
	if DialogueGlobals.funcionaria_letras2_speak == true:
		_sprite_state = "speak"
	else:
		_sprite_state = "idle"
	_sprite.play(_sprite_state)
