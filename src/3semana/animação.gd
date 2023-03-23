extends Node2D

onready var text := $texto

# Varible of control
var count = 0

# Array that stores the frases of the dialogue
var msg_queue: Array = [ 
	"Em uma tarde tranquila na cidade de Pilar," ,
	"o Governador Bode Frederico estava sentado em sua sala quando...",
	"GOVERNADOR!!" ,
	"A CIDADE PRECISA DE VOCÊ!!" , 
	"A POPULAÇÃO PRECISA DE AJUDA!"
	]

func _ready():
	# Calls the function
	_show_message()
	# Set the secretary to invisible
	$"Animação2".visible = false 

func _process(delta):
# Set the secretary to visible after 3 frases
	if count == 3:
		$"Animação2".visible = true
func _show_message():
	count += 1

# When there is no more messages to display
	if msg_queue.size() == 0:
		$texto.hide() # Hide the text
		$ColorRect.hide() # Hide the color rect

	# Change Scene
		TransitionCanvas.change_scene("res://Main.tscn")
		return

# Return the first element and delet him after that
	var msg: String = msg_queue.pop_front()
	$texto.visible_characters = 0

	# Set the label to the text in the variable msg
	$texto.bbcode_text = msg
	$Timer.start()

func _on_Timer_timeout():
	if $texto.visible_characters == $texto.bbcode_text.length():
		$Timer.stop()
	$texto.visible_characters += 1

func _on_TextureButton_pressed():
	_show_message()
