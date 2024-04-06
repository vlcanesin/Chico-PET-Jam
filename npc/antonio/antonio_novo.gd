extends Node2D

const SUSTO_TIME: float = 8.0/6

@onready var _timer = $Cooldown
@onready var _sprite = $AnimatedSprite2D
var _sprite_state: String = "idle"

var on_idle = true
var on_susto = false

func _ready():
	pass

func _process(_delta):
	_adjust_position()
	_sprite.play(_sprite_state)

func _adjust_position():
	if _sprite_state == "idle" and not on_idle:
		position.x += 53
		position.y += 22
		on_idle = true
		on_susto = false
	elif _sprite_state == "susto" and not on_susto:
		position.x -= 53
		position.y -= 22
		on_susto = true
		on_idle = false



func _on_actionable_heard_bark():
	_sprite_state = "susto"
	_timer.start(SUSTO_TIME)

func _on_cooldown_timeout():
	_sprite_state = "idle"
