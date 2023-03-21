extends Sprite

# Variables for interaction and sound effect
var coletou = false
var audio_stream_player: AudioStreamPlayer
onready var audio = $AudioStreamPlayer
var condicao = true

# Adds the number of coins
func coin():
	Global.coin += 1

# Detect the collision and hide the object
func _on_coin_body_entered(body):
	print("oi")
	if (body.name == "Bode") and condicao:
		$AudioStreamPlayer.play()
		coin()
		$CollisionShape2D.disabled = true
		self.visible = false
		condicao = false


func _on_Sprite_area_entered(area):
		$AudioStreamPlayer.play()
		coin()
		$Sprite/CollisionShape2D.disabled = true
		self.visible = false
