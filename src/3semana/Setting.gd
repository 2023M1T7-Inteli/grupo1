extends VBoxContainer

export(String) var label  # Refers to the titles above the volume adjustment buttons
export(String) var bus_name # Refers to the name of the tracks (Music or SFX) that are being adjusted
export(NodePath) var audio_stream_player_path # Refers to the audio files of the tracks

var audio_stream_player: AudioStreamPlayer

onready var play_button = $HBoxContainer/Play # Refers to the button that plays the music
onready var stop_button = $HBoxContainer/Stop # Refers to the button that stops the music

func _ready():
	$Label.text = label # Makes the node Label receive the value from the string label
	audio_stream_player = get_node(audio_stream_player_path)  # Makes the node audio_stream_player receive the audio file from the audio_stream_player_path

# Is activated when the user changes the position of the music slider button marker
func _on_HSlider_value_changed(value):
	var bus_idx = AudioServer.get_bus_index(bus_name)
	if value > $HSlider.min_value: # Is activated when the marker of the slider button is not at its initial position
		AudioServer.set_bus_mute(bus_idx, false) # Makes the music audio be not muted
		AudioServer.set_bus_volume_db(bus_idx, value) # Makes the volume of the music audio equal to the value from the marker's position
	else:
		AudioServer.set_bus_mute(bus_idx, true) # Makes the music audio be muted when the marker is at its initial position

# Same orientation from above, but for audio SFX
func _on_sfx_value_changed(value):
	var bus_idx = AudioServer.get_bus_index("SFX")
	if value > $sfx.min_value:
		AudioServer.set_bus_mute(bus_idx, false)
		print(bus_idx)
		AudioServer.set_bus_volume_db(bus_idx, value)
	else:
		AudioServer.set_bus_mute(bus_idx, true)

# Is activated when the user press the "Tocar" button
func _on_Play_pressed(): 
	audio_stream_player.play() # Plays the selected audio
	play_button.disabled = true  # Disables the "Tocar" button
	stop_button.disabled = false

# Is activated when the user press the "Parar" button
func _on_Stop_pressed(): 
	audio_stream_player.stop() # Stops the selected audio
	play_button.disabled = false
	stop_button.disabled = true # Disables the "Parar" button

# Goes back to the main menu scene
func _on_mainMenuButton_pressed():
	get_tree().change_scene("res://Inicio.tscn")
