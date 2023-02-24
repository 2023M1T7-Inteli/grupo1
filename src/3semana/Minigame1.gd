extends Node2D

# Dictionary with the questions
var dict = { 
	1: "Quanto é 2 + 2?",
	2: "Que número vem depois do 8?",
	3: "Quanto é 6 + 3?",
	4: "Qual o sinal de menos?",
}
onready var popup = $WindowDialog
onready var global = $"/root/Global"
onready var listaComandos = global.listaComandos
onready var estado = global.estado 
var answer: bool


func _ready():
	popup.visible = true
	var number = Global.numQuestion
	var question = dict.get(number)
	print(global.numQuestion)
	$WindowDialog/RichTextLabel.text = question
	
func _process(delta):
	pass
		




func _on_Button2_pressed(): # Button to go back to the previous scene
	get_tree().change_scene("res://Main.tscn")




func _on_bRun_pressed():
	$"/root/Global".estado = true
	print(estado)


func _on_Left_pressed():
	print("left")
	listaComandos.append("left")
	print(listaComandos)
	
func _on_Right_pressed():
	print("right")
	listaComandos.append("right")
	print(listaComandos)
	
func _on_Down_pressed():
	print("down")
	listaComandos.append("down")
	print(listaComandos)

func _on_Up_pressed():
	print("up")
	listaComandos.append("up")
	print(listaComandos)

func _on_A2_body_entered(body):
	answer = false
	print("Falso")
	$WindowDialog/RichTextLabel.text = "Tente novamente"
	$WindowDialog/RichTextLabel.visible = true


func _on_A1_body_entered(body):
	answer = true
	print("verdadeiro")
	$WindowDialog/RichTextLabel.text = "Parabéns você acertou"
	$WindowDialog/RichTextLabel.visible = true
