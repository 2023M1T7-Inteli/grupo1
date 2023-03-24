extends Sprite

func _ready():
	$"../Sprite".hide() # Hide the config screen
	$"../Sprite/CanvasLayer".hide() # Hide the Canvas layer screen
	if Global.intro: # Play the intro just once
		$ColorRect.visible = true
	$"AnimaçãoCaraDoBode/AnimationPlayer".play("animation")
	$LogoBodin/AnimationPlayer.play("animation")
	# Timers for the music starts and the sfx in the beggining
	$Timer.start() 
	$Timer2.start()
	yield($Timer, "timeout")
	$ColorRect.visible = false


# Opens the main scene
func _on_jogar_pressed():
	$"../botao".play()
	Global.intro = false # Variable that controls if the introdution scene show or not
# Just play the animation once
	if Global.animationCount:
		Global.animationCount = false
		TransitionCanvas.change_scene("res://animação.tscn")
	else:
		TransitionCanvas.change_scene("res://Main.tscn")

# Opens the configurations scene
func _on_config_pressed():
	$"../botao".play()
	Global.intro = false
	$"../Sprite".show()
	$"../Sprite/CanvasLayer".show()

# Open the credits scene
func _on_creditos_pressed():
	$"../botao".play()
	Global.intro = false
	TransitionCanvas.change_scene("res://Node2D.tscn")

# Go back to the initial scene
func _on_TextureButton_pressed():
	$"../Sprite".hide()
	$"../Sprite/CanvasLayer".hide()

# Play the SFX sound in the beggining
func _on_Timer2_timeout():
	$"../piscadela".play()
