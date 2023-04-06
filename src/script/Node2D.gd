extends Sprite

# Play the music of the game and start the animation
func _ready():
	TocaMusica.resume()
	$AnimationPlayer.play("default")

# Return to the scene Inicio.tscn
func _on_TextureButton_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://scenes/Inicio.tscn")
