extends Node2D

# Dictionary with the questions
var dict = { 
	1: "Colete todos os lixos da praia",
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
var setas = 1


func _ready():
	TocaMusica.resume()
	# Reset variables
	Global.desconto = 0
	Global.coin = 0
	popup.visible = true
	var number = Global.numQuestion
	var question = dict.get(number)
	
	# Show the initial popup with the messsage and start the animations in the scenario
	$WindowDialog/RichTextLabel.text = "Colete todos os lixos da praia"
	$WindowDialog/restart.hide()
	$WindowDialog/Next.hide()
	$"Palmeira-1/AnimationPlayer".play("Palmeira")
	$"Palmeira-2/AnimationPlayer".play("Palmeira")
	$"Palmeira-3/AnimationPlayer".play("Palmeira")
	$"Agua-animada/AnimationPlayer".play("Agua-animada")
	$barco/AnimationPlayer.play("Barco")
	$Arrow/AnimationPlayer.play("setinha")
	$Arrow2/AnimationPlayer.play("setinha2")
	$Arrow3/AnimationPlayer.play("arrow3")
	$Arrow4/AnimationPlayer.play("setinha4")
	$Arrow2.hide()
	$Arrow3.hide()
	$Arrow4.hide()
# Button to go back to the previous scene
func _on_Button2_pressed(): 
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://Main.tscn")

# Show the wining message to the player
func _process(delta):
	if process:
		$Contador/RichTextLabel.text = str(Global.coin) + "/5"
		
		if Global.coin == 5:
			$Win.play()
			
			# Makes the bode incapable to move and show the popup again with the options to go to the next level or restart the current level
			$Fundo.para_bodin()
			$Fundo/CanvasLayer/Down.disabled = true
			$Fundo/CanvasLayer/Up.disabled = true
			$Fundo/CanvasLayer/Left.disabled = true
			$Fundo/CanvasLayer/Right.disabled = true
			$WindowDialog/RichTextLabel.text = ""
			$WindowDialog/RichTextLabel.visible = true
			popup.visible = true
			$WindowDialog/Node2D._on_Pronto_pressed()
			
			# Reset the variables and show the buttons
			Global.coin == 0
			process = false
			Global.cadeado1 += 1
			$WindowDialog/restart.show()
			$WindowDialog/Next.show()

# Close popup
func _on_closePopup_pressed():
	popup.visible = false
	$WindowDialog/closePopup.disabled = true
	$Arrow.hide()
	$Arrow2.show()

# Number of missing vetors
func _on_Fundo_vetor(comandList):
	$WindowDialog/RichTextLabel.text = "coloque no mínimo 10 vetores, " + String(comandList.size()) + " até agora"
	$WindowDialog/RichTextLabel.visible = true
	popup.visible = true

# Restart the Scene
func _on_restart_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://Minigame1.tscn")

# Move back to the previous scene
func _on_TextureButton_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://Main.tscn")


# Functions that makes the tutorial

func _on_Fundo_arrow2(direction):
	if setas == 1:
		$Arrow2.hide()
		$Arrow3.show()
		setas += 1

func _on_Fundo_arrow3(direction2):
	if setas == 2:
		$Arrow3.hide()
		$Arrow4.show()
		setas += 1

func _on_Fundo_arrow4(direction3):
	if setas == 3:
		$Arrow4.hide()
		setas = 0
