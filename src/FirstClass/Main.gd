extends Node


# Declare member variables here. Examples:
var my_dict = {1: "A", 2: "B"}



# Called when the node enters the scene tree for the first time.
func _ready():
	pass




func _on_Button_pressed(): # Botão 1
	Global.numQuestion = 1
	get_tree().change_scene("res://Minigame1.tscn")
	
	

func _on_Button2_pressed():
	Global.numQuestion = 2
	get_tree().change_scene("res://Minigame1.tscn")
	


func _on_Button3_pressed():
	Global.numQuestion = 3
	get_tree().change_scene("res://Minigame1.tscn")


func _on_Button4_pressed():
	Global.numQuestion = 4
	get_tree().change_scene("res://Minigame1.tscn")


func _on_ButtonVoltar_pressed():
	get_tree().change_scene("res://Inicio.tscn")
