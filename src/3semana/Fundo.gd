extends Sprite

func _ready():
	if Global.intro:
		$ColorRect.visible = true
	$"AnimaçãoCaraDoBode/AnimationPlayer".play("animation")
	$LogoBodin/AnimationPlayer.play("animation")
	$Timer.start()
	yield($Timer, "timeout")
	$ColorRect.visible = false

# Opens the main scene
func _on_jogar_pressed():
	Global.intro = false # Variable that controls if the introdution scene show or not
# Just play the animation once
	if Global.animationCount:
		Global.animationCount = false
		TransitionCanvas.change_scene("res://animação.tscn")
	else:
		TransitionCanvas.change_scene("res://Main.tscn")

# Opens the configurations scene
func _on_config_pressed():
	Global.intro = false
	TransitionCanvas.change_scene("res://Control.tscn")

# Open the credits scene
func _on_creditos_pressed():
	Global.intro = false
	TransitionCanvas.change_scene("res://Node2D.tscn")
