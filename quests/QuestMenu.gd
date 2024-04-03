extends Control

@onready var _open_quests = $BotaoQuests/OpenQuests
@onready var _back = $Quadro/Back
@onready var _quadro = $Quadro
@onready var _button = $BotaoQuests
@onready var _prova_calculo = $Quadro/ProvaCalculo
@onready var _estudar = $Quadro/ProvaCalculo/Estudar
@onready var _pegue_lapis = $Quadro/ProvaCalculo/PegueLapis
@onready var _beba_agua = $Quadro/BebaAgua
@onready var _pegue_tri = $Quadro/PegueTRI

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
	_prova_calculo.visible = LogicGlobals.unlock_calc_study
	_estudar.visible = LogicGlobals.unlock_calc_study
	_pegue_lapis.visible = LogicGlobals.unlock_calc_pencil
	_beba_agua.visible = LogicGlobals.unlock_water
	_pegue_tri.visible = LogicGlobals.unlock_tri

func _on_open_quests_pressed():
	show_quadro = true
	show_button = not show_quadro
	
func _on_back_pressed():
	show_button = true
	show_quadro = not show_button
