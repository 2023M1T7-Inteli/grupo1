extends Node2D

onready var voltar = $Node2D/Fundo/voltar

# Move back to the initial screen
func _on_voltar_pressed():
	get_tree().change_scene("res://inicio.tscn")

