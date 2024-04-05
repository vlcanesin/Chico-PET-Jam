extends CollisionShape2D

func _process(_delta):
	if LogicGlobals.chico_found_caramelo or not LogicGlobals.enable_follow_at_bark:
		position.y = 10000
	else:
		position.y = 0

func _on_actionable_heard_bark():
	position.y = 10000
