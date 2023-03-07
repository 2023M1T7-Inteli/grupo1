extends Area2D

var coletou = false
var audio_stream_player: AudioStreamPlayer
onready var audio = $AudioStreamPlayer

func coin():
	Global.coin += 1
	print(Global.coin)

func _on_coin_body_entered(body):
	if (body.name == "Bode"):
		$AudioStreamPlayer.play()
		coin()
		$CollisionShape2D.disabled = true
		self.visible = false

	if Global.coin == 5:
		print("vc ganhou!!")
