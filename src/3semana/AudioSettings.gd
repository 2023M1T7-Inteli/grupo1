extends CanvasLayer

# Controls the mester volume of the game
func _on_volumeMestre_value_changed(value1):
	if value1 <= -30:
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false)
		AudioServer.set_bus_volume_db(0, value1)


# Controls the music volume of the game
func _on_volumeMusica_value_changed(value2):
	if value2 <= -30:
		AudioServer.set_bus_mute(1, true)
	else:
		AudioServer.set_bus_mute(1, false)
		AudioServer.set_bus_volume_db(1, value2)


# Controls the SFX volume of the game
func _on_volumeSFX_value_changed(value3):
	if value3 <= -30:
		AudioServer.set_bus_mute(2, true)
	else:
		AudioServer.set_bus_mute(2, false)
		AudioServer.set_bus_volume_db(2, value3)



