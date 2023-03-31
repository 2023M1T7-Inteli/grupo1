extends Sprite

func _ready():
	TocaMusica.resume()

# Return to the scene Inicio.tscn
func _on_TextureButton_pressed():
	TocaMusica.pause()
	TransitionCanvas.change_scene("res://scenes/Inicio.tscn")
