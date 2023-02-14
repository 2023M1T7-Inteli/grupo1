extends Node2D

var dict = { # Dicionário com as perguntas
	1: "Quanto é 2 + 2?",
	2: "Que número vem depois do 8?",
	3: "Quanto é 6 + 3?",
	4: "Qual o sinal de menos?",
}
onready var popup = $WindowDialog


func _ready():
	popup.visible = true
	var number = Global.numQuestion
	var question = dict.get(number)
	print(Global.numQuestion)
	$WindowDialog/RichTextLabel.text = question




func _on_Button2_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Setas.tscn")
