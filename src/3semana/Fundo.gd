extends Sprite

func _ready():
	$"../Sprite".hide()
	$"../Sprite/CanvasLayer".hide()
	if Global.intro:
		$ColorRect.visible = true
	$"AnimaçãoCaraDoBode/AnimationPlayer".play("animation")
	$LogoBodin/AnimationPlayer.play("animation")
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


func _on_TextureButton_pressed():
	$"../Sprite".hide()
	$"../Sprite/CanvasLayer".hide()


func _on_Timer2_timeout():
	$"../piscadela".play()
