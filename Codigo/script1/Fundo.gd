extends Sprite

onready var jogar = $Inicio/Fundo/jogar
onready var config = $Inicio/Fundo/config
onready var creditos = $Inicio/Fundo/creditos

func _on_jogar_pressed():
	get_tree().change_scene("res://.mono/Main.tscn")
	# abre o jogo
	
func _on_config_pressed():
	get_tree().change_scene("res://config.tscn")
	# abre as opções de configurações

func _on_creditos_pressed():
	get_tree().change_scene("res://Node2D.tscn")
	# abre a lista de créditos
