extends Area2D

signal collision

func _process(_delta):
	if LogicGlobals.chico_iswith_tri:
		position.y = 10000

func action():
	collision.emit()
