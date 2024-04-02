extends Control

@onready var sleepSprite = $ChicoDorme


func _ready():
	sleepSprite.play("dorme")


func _on_novo_jogo_botao_pressed():
	get_tree().change_scene_to_file("res://locais/spawnFisicaLetras.tscn")



func _on_galeria_botao_pressed():
	get_tree().change_scene_to_file("res://locais/achievements.tscn")


func _on_sair_botao_pressed():
	get_tree().quit()
