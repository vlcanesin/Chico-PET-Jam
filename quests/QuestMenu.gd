extends Control

@onready var _open_quests = $BotaoQuests/OpenQuests
@onready var _back = $Quadro/Back
@onready var _quadro = $Quadro
@onready var _button = $BotaoQuests

var show_quadro: bool = false
var show_button: bool = not show_quadro

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var canvas_position = self.get_canvas_transform().origin
	self.global_position = Vector2(850, 20) - canvas_position
	_quadro.visible = show_quadro
	_button.visible = show_button

func _on_open_quests_pressed():
	show_quadro = true
	show_button = not show_quadro
	
func _on_back_pressed():
	show_button = true
	show_quadro = not show_button
