extends Node

# Declare member variables here. Examples:
var my_dict = {1: "A", 2: "B"}

# List of buttons levels and their respective levels

# Level one
func _on_Button_pressed(): 
	Global.numQuestion = 1
	get_tree().change_scene("res://Minigame1.tscn")
	
	

# Level two
func _on_Button2_pressed():
	Global.numQuestion = 2
	get_tree().change_scene("res://Minigame1.tscn")
	

# Level three
func _on_Button3_pressed():
	Global.numQuestion = 3
	get_tree().change_scene("res://Minigame1.tscn")


# Level four
func _on_Button4_pressed():
	Global.numQuestion = 4
	get_tree().change_scene("res://Minigame1.tscn")

# Move back to the initial screen
func _on_moveBackButton_pressed():
	get_tree().change_scene("res://Inicio.tscn")

