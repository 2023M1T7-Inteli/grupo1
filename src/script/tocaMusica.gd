extends Node
var temp = 0

# Play the music for the whole game
func _on_Timer_timeout():
	self.resume()

# Function that pausea the music between the scenes
func pause():
	temp = $musicaDeFundo.get_playback_position()
	$musicaDeFundo.stop()

# Function that resume the music after entering a new scene
func resume():
	$musicaDeFundo.play()
	$musicaDeFundo.seek(temp)
