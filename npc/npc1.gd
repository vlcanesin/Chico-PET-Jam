extends Node2D

@onready var _sprite = $AnimatedSprite2D
@onready var _dialogue_manager = $DialogueManager
var _sprite_state: String = "idle"

func _ready():
	_dialogue_manager.start_dialogue.connect(_on_start_dialogue)
	_dialogue_manager.end_dialogue.connect(_on_end_dialogue)

func _process(_delta):
	_sprite.play(_sprite_state)

func _on_start_dialogue():
	print("Entrei no diálogo")
	_sprite_state = "speak"

func _on_end_dialogue():
	print("Saí no diálogo")
	_sprite_state = "idle"
