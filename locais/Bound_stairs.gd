extends StaticBody2D

func _enter_tree():
	if LogicGlobals.chico_already_ALGOAQUI:
		self.queue_free()

func disappear():
	#process_mode = Node.PROCESS_MODE_DISABLED
	set_collision_layer_value(1, false)
