extends Node2D

var list = [""] # criação da lista
var lista = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$Label.text = lista
	$Label.text = lista


func _on_buttonUp_pressed():
	list.push_back("up")
	lista += "UP "


func _on_ButtonRight_pressed():
	list.push_back("right")
	lista += "RIGHT "

func _on_buttonLeft_pressed():
	list.push_back("left")
	lista += "LEFT "


func _on_buttonDown_pressed():
	list.push_back("down")
	lista += "DOWN "


func _on_Button_pressed():
	get_tree().change_scene("res://Minigame1.tscn")
