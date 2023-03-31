extends Node2D

onready var text := $texto

# Variable of control
var count = 0

# Array variable that stores the dialogue lines
var msg_queue: Array = [ 
	"Opa!" ,
	"Bom dia Senhor Frederico!",
	"O senhor viu a bagunça que fizeram aqui?" ,
	"Eu queria pescar, mas não consigo com todo esse lixo." , 
	"O senhor poderia me ajudar a limpar a praia?"
	]

func _ready():
	$AnimationPlayer.play("Nuvens")
	$Fundo.play()
	TocaMusica.resume()
	# Calls the function
	_show_message()
	# Set the fisherman's sprite to invisible
	$Pescador.visible = false 

func _process(delta):
	# Set the fisherman's sprite to visible after 2 dialogue lines
	if count == 2:
		$Pescador.visible = true
func _show_message():
	count += 1

	# When there is no more messages to display, it hides the scene
	if msg_queue.size() == 0:
		$texto.hide() # Hide the text
		$ColorRect.hide() # Hide the color rect
	# And it also changes the scene
		TransitionCanvas.change_scene("res://scenes/Minigame1.tscn")
		TocaMusica.pause()
		return

# Return the first element and delet it after that
	var msg: String = msg_queue.pop_front()
	$texto.visible_characters = 0

	# Set the label to the text in the variable msg
	$texto.bbcode_text = msg
	$Timer.start()

# Finishes the text in the box
func _on_Timer_timeout():
	if $texto.visible_characters == $texto.bbcode_text.length():
		$Timer.stop()
	$texto.visible_characters += 1

# Show the next message 
func _on_TextureButton_pressed():
	_show_message()
