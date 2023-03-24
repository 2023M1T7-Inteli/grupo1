extends CanvasLayer


# Makes the fade in and the fade out between
func change_scene(target: String) -> void:
	$AnimationPlayer.play("fade_in")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("fade_in")
