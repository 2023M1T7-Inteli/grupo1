extends Sprite

# Variables for interaction and sound effect
var coletou = false
var audio_stream_player: AudioStreamPlayer
onready var audio = $AudioStreamPlayer
var condicao = true

# Adds the number of coins
func coin():
	Global.coin += 1

func _on_Sprite_area_entered(area):
		print($area2d/CollisionShape2D.disabled)
		$AudioStreamPlayer.play()
		coin()
		queue_free()
		
