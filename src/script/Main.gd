extends Node

# Declare member variables here. Examples:
#var my_dict = {1: "A", 2: "B"}

# Show in the screen the Total score of the player and verify if the locks gonna be unlocked
func _ready():
	TocaMusica.resume()
	$"HudBordadoPontuacao-1png(1)/Label".text = str(Global.score) 
	if Global.cadeado1 != 0:
		$Cadeado1.hide()
	if Global.cadeado2 != 0:
		$Cadeado2.hide()
	if Global.cadeado3 != 0:
		$Cadeado3.hide()

func _process(delta):
	# Verify if the locks gonna be unlocked
	if Global.cadeado1 != 0:
		$Cadeado1.hide()
	if Global.cadeado2 != 0:
		$Cadeado2.hide()
	if Global.cadeado3 != 0:
		$Cadeado3.hide()

# List of buttons levels and their respective levels

# Level one
func _on_Button_pressed(): 
	TocaMusica.pause()
	$Botao.play()
	Global.numQuestion = 1
	TransitionCanvas.change_scene("res://scenes/AnimacaoPescador.tscn")
	
	

# Level two
func _on_Button2_pressed():
	if Global.cadeado1 != 0:
		TocaMusica.pause()
		$Botao.play()
		Global.numQuestion = 2
		TransitionCanvas.change_scene("res://scenes/Minigame2.tscn")
	

# Level three
func _on_Button3_pressed():
	if Global.cadeado2 != 0:
		TocaMusica.pause()
		$Botao.play()
		Global.numQuestion = 3
		TransitionCanvas.change_scene("res://scenes/Minigame3.tscn")


# Level four
func _on_Button4_pressed():
	if Global.cadeado3 != 0:
		TocaMusica.pause()
		$Botao.play()
		Global.numQuestion = 4
		TransitionCanvas.change_scene("res://scenes/Minigame4.tscn")

# Move back to the initial screen
func _on_moveBackButton_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://scenes/Inicio.tscn")

# Move on to the next phase
func _on_fase2_pressed():
	TransitionCanvas.change_scene("res://scenes/Main2f.tscn")
