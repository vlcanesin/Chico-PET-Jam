extends Node2D

@onready var _sprite = $AnimatedSprite2D
var _sprite_state: String = "idle"

func _ready():
	pass

func _process(_delta):
	_sprite.play(_sprite_state)

func _on_dialogue_manager_start_dialogue():
	#print("Entrei no diálogo")
	_sprite_state = "speak"

func _on_dialogue_manager_end_dialogue():
	#print("Saí no diálogo")
	_sprite_state = "idle"
