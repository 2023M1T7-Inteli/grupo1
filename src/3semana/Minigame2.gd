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
var process = true
onready var receptor = get_node("Fundo")


func _ready():
	# Reset the variables
	Global.desconto = 0
	Global.desconto = 0
	Global.garrafa = 0
	popup.visible = true
	var number = Global.numQuestion
	var question = dict.get(number)
	
	# Show the initial popup with the messsage and start the animations in the scenario
	$WindowDialog/RichTextLabel.text = "Colete apenas garrafas"
	$WindowDialog/restart.hide()
	$WindowDialog/Next.hide()
	$"Palmeira-2/AnimationPlayer".play("Palmeira")
	$"Palmeira-3/AnimationPlayer".play("Palmeira")
	$"Agua-animada/AnimationPlayer".play("Agua-animada")
	$barco/AnimationPlayer.play("Barco")
	
# Button to go back to the previous scene
func _on_Button2_pressed(): 
	TransitionCanvas.change_scene("res://Main.tscn")

# Show the wining message to the player
func _process(delta):
	
	if process:
		if Global.garrafa == 4:
			# Makes the bode incapable to move and show the popup again with the options to go to the next level or restart the current level
			$Win.play()
			$Fundo.para_bodin()
			$Fundo/CanvasLayer/Down.disabled = true
			$Fundo/CanvasLayer/Up.disabled = true
			$Fundo/CanvasLayer/Left.disabled = true
			$Fundo/CanvasLayer/Right.disabled = true
			$WindowDialog/RichTextLabel.text = ""
			$WindowDialog/RichTextLabel.visible = true
			popup.visible = true
			$WindowDialog/Node2D._on_Pronto_pressed()
			Global.coin = 0
			process = false
			Global.cadeado2 += 1
			$WindowDialog/restart.show()
			$WindowDialog/Next.show()

# Close popup
func _on_closePopup_pressed():
	popup.visible = false
	$WindowDialog/closePopup.disabled = true

# Number of missing vetors
func _on_Fundo_vetor(comandList):
	$WindowDialog/RichTextLabel.text = "coloque no mínimo 10 vetores, " + String(comandList.size()) + " até agora"
	$WindowDialog/RichTextLabel.visible = true
	popup.visible = true

# Restart the Scene
func _on_restart_pressed():
	TransitionCanvas.change_scene("res://Minigame2.tscn")

# Move to the previous scene
func _on_Next_pressed():
	TransitionCanvas.change_scene("res://Main.tscn")
