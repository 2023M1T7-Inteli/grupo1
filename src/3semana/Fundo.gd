extends Sprite

func _on_jogar_pressed():
	get_tree().change_scene("res://Main.tscn")
	# Opens the main scene
	
func _on_config_pressed():
	get_tree().change_scene("res://config.tscn")
	# Opens the configurations scene

func _on_creditos_pressed():
	get_tree().change_scene("res://Node2D.tscn")
	# Open the credits scene
