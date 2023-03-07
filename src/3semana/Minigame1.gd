extends Node2D

# Dictionary with the questions
var dict = { 
	1: "Colete as maçãs na ordem correta",
	2: "Que número vem depois do 8?",
	3: "Quanto é 6 + 3?",
	4: "Qual o sinal de menos?",
}
# List of variables
onready var popup = $WindowDialog
onready var global = $"/root/Global"
onready var listaComandos = Global.listaComandos
onready var estado = global.estado 
var answer: bool
var process = true

# Show the question in the popup
func _ready():
	popup.visible = true
	var number = Global.numQuestion
	var question = dict.get(number)
	print(global.numQuestion)
	$WindowDialog/RichTextLabel.text = question


# Button to go back to the previous scene
func _on_Button2_pressed(): 
	get_tree().change_scene("res://Main.tscn")
	

# Show if the player have lost
func _on_A2_body_entered(body):
	answer = false
	print("Falso")
	$WindowDialog/RichTextLabel.text = "Tente novamente"
	$WindowDialog/RichTextLabel.visible = true
	$AudioStreamPlayer2D.play()

# Show if the player have won
func _on_A1_body_entered(body):
	answer = true
	print("verdadeiro")
	$WindowDialog/RichTextLabel.text = "Parabéns você acertou"
	$WindowDialog/RichTextLabel.visible = true

# Show the wining message to the player
func _process(delta):
	if process:
		if Global.coin == 5:
			print("entrou")
			$WindowDialog/RichTextLabel.text = "Parabéns você acertou!! pressione R para reiniciar"
			$WindowDialog/RichTextLabel.visible = true
			popup.visible = true
			Global.coin == 0
			process = false
	if Input.is_action_just_pressed("ui_reset"):
		get_tree().change_scene("res://Minigame1.tscn")


func _on_closePopup_pressed():
	
	popup.visible = false
