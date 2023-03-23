extends Button

onready var voltar = $jogar/Fundo/voltar

# Move back to the initial screen
func _on_voltar_pressed():
	get_tree().change_scene("res://inicio.tscn")
