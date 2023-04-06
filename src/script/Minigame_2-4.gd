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
	TocaMusica.resume()
	# Reset the variables
	Global.desconto = 0
	Global.garrafa = 0
	popup.visible = true
	var number = Global.numQuestion
	var question = dict.get(number)
	
	# Show the initial popup with the messsage and start the animations in the scenario
	$WindowDialog/RichTextLabel.text = "Colete os todos os itens"
	$WindowDialog/restart.hide()
	$WindowDialog/Next.hide()
	$WindowDialog/buttonAnswer1.hide()
	$WindowDialog/buttonAnswer2.hide()
	$WindowDialog/buttonAnswer3.hide()
	$WindowDialog/buttonAnswer4.hide()
	
	
# Button to go back to the previous scene
func _on_Button2_pressed(): 
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://scenes/Main2f.tscn")

# Show the wining message to the player
func _process(delta):
	if process:
		
		$Contador/RichTextLabel.text = str(Global.coin) + "/4"
		if Global.coin >= 2:
			$colisionBoard/obstaculo7.position = Vector2(500,200)
		
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
			#Global.cadeado21 += 1
			$WindowDialog/restart.show()
			$WindowDialog/Next.show()

# Close popup
func _on_closePopup_pressed():
	$popWarn.visible = true
	popup.visible = false
	$WindowDialog/closePopup.disabled = true

# Number of missing vetors
func _on_Fundo_vetor(comandList):
	$WindowDialog/RichTextLabel.text = "coloque no mínimo 10 vetores, " + String(comandList.size()) + " até agora"
	$WindowDialog/RichTextLabel.visible = true
	popup.visible = true

# Restart the Scene
func _on_restart_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://scenes/Minigame_2-4.tscn")

# Move to the previous scene
func _on_Next_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://scenes/Main2f.tscn")

# Show the question popup with the buttons with the answers
func _on_Fundo_showQuestion():
	$Fundo.para_bodin()
	$WindowDialog/RichTextLabel.text = "12 x 2 = ?"
	$WindowDialog/RichTextLabel.visible = true
	$WindowDialog/buttonAnswer1.show()
	$WindowDialog/buttonAnswer2.show()
	$WindowDialog/buttonAnswer3.show()
	$WindowDialog/buttonAnswer4.show()
	$WindowDialog.visible = true
	$Fundo/CanvasLayer/Down.disabled = true
	$Fundo/CanvasLayer/Up.disabled = true
	$Fundo/CanvasLayer/Left.disabled = true
	$Fundo/CanvasLayer/Right.disabled = true

# The correct answer that makes the player win the game and show the victorious popup
func _on_buttonAnswer1_pressed():
	$Win.play()
	$WindowDialog/RichTextLabel.text = ""
	$WindowDialog/RichTextLabel.visible = true
	popup.visible = true
	$WindowDialog/boiBumba.visible = true
	$WindowDialog/Node2D._on_Pronto_pressed()
	Global.coin = 0
	process = false
	$WindowDialog/restart.show()
	$WindowDialog/Next.show()
	$WindowDialog/Next.disabled = false
	$WindowDialog/buttonAnswer1.hide()
	$WindowDialog/buttonAnswer2.hide()
	$WindowDialog/buttonAnswer3.hide()
	$WindowDialog/buttonAnswer4.hide()

# Wrong answer, resets the scene
func _on_buttonAnswer2_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://scenes/Minigame_2-4.tscn")

# Wrong answer, resets the scene
func _on_buttonAnswer3_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://scenes/Minigame_2-4.tscn")

# Wrong answer, resets the scene
func _on_buttonAnswer4_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://scenes/Minigame_2-4.tscn")

# Close the popup
func _on_TextureButton_pressed():
	$popWarn.visible = false
