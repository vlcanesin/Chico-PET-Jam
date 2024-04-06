extends Node2D

func _on_actionable_heard_bark():
	self.position.y = 233
	self.position.x = -79
	LogicGlobals.can_Get_Water = true
