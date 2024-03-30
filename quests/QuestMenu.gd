extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var canvas_position = self.get_canvas_transform().origin
	self.global_position = Vector2(850, 20) - canvas_position
