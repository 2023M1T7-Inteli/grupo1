extends VBoxContainer

export(String) var label  # Refers to the titles above the volume adjustment buttons
export(String) var bus_name # Refers to the name of the tracks (Music or SFX) that are being adjusted
export(NodePath) var audio_stream_player_path # Refers to the audio files of the tracks

var audio_stream_player: AudioStreamPlayer

onready var play_button = $HBoxContainer/Play # Refers to the button that plays the music
onready var stop_button = $HBoxContainer/Stop # Refers to the button that stops the music

func _ready():
	$Label.text = label # Makes the node Label receive the value from the string label
	audio_stream_player = get_node(audio_stream_player_path)



func _on_HSlider_value_changed(value):
	var bus_idx = AudioServer.get_bus_index(bus_name)
	if value > $HSlider.min_value:
		AudioServer.set_bus_mute(bus_idx, false)
		print(bus_idx)
		AudioServer.set_bus_volume_db(bus_idx, value)
	else:
		AudioServer.set_bus_mute(bus_idx, true)



func _on_Play_pressed():
	audio_stream_player.play()
	play_button.disabled = true
	stop_button.disabled = false


func _on_Stop_pressed():
	audio_stream_player.stop()
	play_button.disabled = false
	stop_button.disabled = true



func _on_mainMenuButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Inicio.tscn")




func _on_sfx_value_changed(value):
	var bus_idx = AudioServer.get_bus_index("SFX")
	if value > $sfx.min_value:
		AudioServer.set_bus_mute(bus_idx, false)
		print(bus_idx)
		AudioServer.set_bus_volume_db(bus_idx, value)
	else:
		AudioServer.set_bus_mute(bus_idx, true)
