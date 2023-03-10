extends Sprite


# Opens the main scene
func _on_jogar_pressed():

# Just play the animation once
	if Global.animationCount:
		Global.animationCount = false
		get_tree().change_scene("res://animação.tscn")
	else:
		get_tree().change_scene("res://Main.tscn")

# Opens the configurations scene
func _on_config_pressed():
	get_tree().change_scene("res://Control.tscn")

# Open the credits scene
func _on_creditos_pressed():
	get_tree().change_scene("res://Node2D.tscn")
