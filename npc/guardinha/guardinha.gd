extends Node2D

@onready var _sprite = $AnimatedSprite2D
var _sprite_state: String = "idle"

var goto_position = Vector2(7082, 287)
var dist = 300

func _ready():
	goto_position = Vector2(position.x - dist, position.y)

func _process(_delta):
	if LogicGlobals.dogfight_is_running:
		var tween = create_tween()
		tween.tween_property(self, "position", goto_position, 1)
		tween.tween_callback(
			func end_movement():
				self.position = goto_position
		)                     
	if DialogueGlobals.guardinha_speak == true:
		_sprite_state = "speak"
	else:
		_sprite_state = "idle"
	_sprite.play(_sprite_state)
