extends Sprite

# Variables for interaction and sound effect
var coletou = false
var audio_stream_player: AudioStreamPlayer
onready var audio = $AudioStreamPlayer
var condicao = true

# Adds the number of coins
func coin():
	Global.coin += 1

# Identify the area that entered in the coin
func _on_Sprite_area_entered(area):
	if area.is_in_group("bode"):
		print($area2d/CollisionShape2D.disabled)
		$AudioStreamPlayer.play()
		coin()
		queue_free()
		
