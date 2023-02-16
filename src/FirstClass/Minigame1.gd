extends Node2D

var dict = { # Dicionário com as perguntas
	1: "Quanto é 2 + 2?",
	2: "Que número vem depois do 8?",
	3: "Quanto é 6 + 3?",
	4: "Qual o sinal de menos?",
}
onready var popup = $WindowDialog
onready var global = $"/root/Global"
onready var listaComandos = global.listaComandos
onready var estado = global.estado # Indica se o personagem está andando ou parado


func _ready():
	popup.visible = true
	var number = Global.numQuestion
	var question = dict.get(number)
	print(Global.numQuestion)
	$WindowDialog/RichTextLabel.text = question
	
func _process(delta):
	if estado:
		pass # andar através de uma lista
		




func _on_Button2_pressed(): # When arrow button to back
	get_tree().change_scene("res://Main.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://Setas.tscn")

# Setas
func _on_Left_pressed():
	print("aqui") # When left arrow is pressed
	listaComandos.push_back("left") # Put the string left at the of of the array
	print(listaComandos) # Print the list. Just a check out.

# Same dinamic of the func above
func _on_Right_pressed():
	listaComandos.push_back("right")
	print(listaComandos)

func _on_Up_pressed():
	listaComandos.push_back("up")
	print(listaComandos)

func _on_Down_pressed():
	listaComandos.push_back("down")
	print(listaComandos)
	

func _on_bRun_pressed():
	estado = true
