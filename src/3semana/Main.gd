extends Node

# Declare member variables here. Examples:
var my_dict = {1: "A", 2: "B"}

# List of buttons levels and their respective levels
func _ready():
	if Global.cadeado1 != 0:
		$Cadeado1.hide()
	if Global.cadeado2 != 0:
		$Cadeado2.hide()
	if Global.cadeado3 != 0:
		$Cadeado3.hide()
	
	
# Level one
func _on_Button_pressed(): 
	Global.numQuestion = 1
	TransitionCanvas.change_scene("res://Minigame1.tscn")
	
	

# Level two
func _on_Button2_pressed():
	if Global.cadeado1 != 0:
		Global.numQuestion = 2
		TransitionCanvas.change_scene("res://Minigame2.tscn")
	

# Level three
func _on_Button3_pressed():
	if Global.cadeado2 != 0:
		Global.numQuestion = 3
		TransitionCanvas.change_scene("res://Minigame3.tscn")


# Level four
func _on_Button4_pressed():
	if Global.cadeado3 != 0:
		Global.numQuestion = 4
		TransitionCanvas.change_scene("res://Minigame4.tscn")

# Move back to the initial screen
func _on_moveBackButton_pressed():
	TransitionCanvas.change_scene("res://Inicio.tscn")

