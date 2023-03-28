extends Node
var temp = 0

# Play the music for the whole game
func _on_Timer_timeout():
	self.resume()
	
func pause():
	temp = $musicaDeFundo.get_playback_position()
	$musicaDeFundo.stop()

func resume():
	$musicaDeFundo.play()
	$musicaDeFundo.seek(temp)
