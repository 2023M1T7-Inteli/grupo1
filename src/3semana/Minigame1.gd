extends Node2D

# Dictionary with the questions
var dict = { 
	1: "Colete todas as maçãs",
	2: "Que número vem depois do 8?",
	3: "Quanto é 6 + 3?",
	4: "Qual o sinal de menos?",
}

# List of variables
onready var popup = $WindowDialog
onready var global = $"/root/Global"
onready var listaComandos = Global.listaComandos
onready var estado = global.estado 
var process = true
onready var receptor = get_node("Fundo")

# Show the question in the popup
func _ready():
	popup.visible = true
	var number = Global.numQuestion
	var question = dict.get(number)
	print(global.numQuestion)
	$WindowDialog/RichTextLabel.text = question
	$WindowDialog/restart.hide()

# Button to go back to the previous scene
func _on_Button2_pressed(): 
	get_tree().change_scene("res://Main.tscn")

# Show the wining message to the player
func _process(delta):
	if process:
		if Global.coin == 5:
			print("entrou")
			$WindowDialog/RichTextLabel.text = "Parabéns você conseguiu!!"
			$WindowDialog/RichTextLabel.visible = true
			popup.visible = true
			Global.coin == 0
			process = false
			$WindowDialog/restart.show()

# Close popup
func _on_closePopup_pressed():
	popup.visible = false

# Number of missing vetors
func _on_Fundo_vetor(comandList):
	$WindowDialog/RichTextLabel.text = "coloque no mínimo 10 vetores, " + String(comandList.size()) + " até agora"
	$WindowDialog/RichTextLabel.visible = true
	popup.visible = true

# Restart the Scene
func _on_restart_pressed():
	get_tree().change_scene("res://Minigame1.tscn")
