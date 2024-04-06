extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if LogicGlobals.can_Get_Water == true:
		self.position.y = 450
		LogicGlobals.unlock_MIJAR = true
