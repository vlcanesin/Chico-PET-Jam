extends Node2D

@onready var luta = $Luta

func _ready():
	LogicGlobals.enable_collision_actionables = true

func _process(_delta):
	if LogicGlobals.dogfight_is_running:
		luta.visible = true
	else:
		luta.visible = false
