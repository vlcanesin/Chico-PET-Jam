extends CollisionShape2D

func _process(delta):
	if LogicGlobals.chico_already_seen_sagui:
		position.y = 10000
