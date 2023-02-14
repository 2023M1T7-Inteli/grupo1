extends Button

onready var voltar = $jogar/Fundo/voltar

func _on_voltar_pressed():
	get_tree().change_scene("res://inicio.tscn")
	# volta para a tela inicial
