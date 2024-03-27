extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_novo_jogo_botao_pressed():
	get_tree().change_scene_to_file("res://locais/spawnFisicaLetras.tscn")


func _on_continuar_botao_pressed():
	pass # Replace with function body.


func _on_galeria_botao_pressed():
	pass # Replace with function body.


func _on_sair_botao_pressed():
	get_tree().quit()
