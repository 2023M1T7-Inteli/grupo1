extends Node

# Show in the screen the Total score of the player and verify if the locks gonna be unlocked
func _ready():
	TocaMusica.resume()
	$"HudBordadoPontuacao-1png(1)/Label".text = str(Global.score) 
	if Global.cadeado21 != 0:
		$Cadeado1.hide()
	if Global.cadeado22 != 0:
		$Cadeado2.hide()
	if Global.cadeado23 != 0:
		$Cadeado3.hide()

func _process(delta):
	# Verify if the locks gonna be unlocked
	if Global.cadeado21 != 0:
		$Cadeado1.hide()
	if Global.cadeado22 != 0:
		$Cadeado2.hide()
	if Global.cadeado23 != 0:
		$Cadeado3.hide()

# List of buttons levels and their respective levels

# Level one
func _on_Button_pressed(): 
	TocaMusica.pause()
	$Botao.play()
	Global.numQuestion = 1
	TransitionCanvas.change_scene("res://scenes/AnimacaoPintinho.tscn")
	
	

# Level two
func _on_Button2_pressed():
	if Global.cadeado21 != 0:
		TocaMusica.pause()
		$Botao.play()
		Global.numQuestion = 2
		TransitionCanvas.change_scene("res://scenes/Minigame_2-2.tscn")
	

# Level three
func _on_Button3_pressed():
	if Global.cadeado22 != 0:
		TocaMusica.pause()
		$Botao.play()
		Global.numQuestion = 3
		TransitionCanvas.change_scene("res://scenes/Minigame_2-3.tscn")


# Level four
func _on_Button4_pressed():
	if Global.cadeado23 != 0:
		TocaMusica.pause()
		$Botao.play()
		Global.numQuestion = 4
		TransitionCanvas.change_scene("res://scenes/Minigame_2-4.tscn")

# Move back to the initial screen
func _on_moveBackButton_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://scenes/Main.tscn")

