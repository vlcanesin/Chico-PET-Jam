extends RichTextLabel

func _process(_delta):
	if LogicGlobals.calc_pencil_completed:
		self.add_theme_color_override("default_color", Color(0.97, 0.97, 0))
