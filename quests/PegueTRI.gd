extends RichTextLabel

func _process(_delta):
	if LogicGlobals.chico_iswith_tri:
		self.add_theme_color_override("default_color", Color(0.97, 0.97, 0))
