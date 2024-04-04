extends CollisionShape2D

func _process(delta):
	if LogicGlobals.chico_already_seen_sagui:
		position.x = -330
