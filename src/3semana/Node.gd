extends Node

# Plays the animation in the beggining of the game
func _ready():
	$"AnimaçãoCaraDoBode/AnimationPlayer".play("animation")
