extends Node2D

@onready var _sprite = $LutaSprite
# Called when the node enters the scene tree for the first time.
func _ready():
	_sprite.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
