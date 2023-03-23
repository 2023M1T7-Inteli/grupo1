extends Node2D

# Dictionary with the questions
var dict = { 
	1: "Colete todos os lixos da praia",
	2: "Que número vem depois do 8?",
	3: "Quanto é 6 + 3?",
	4: "Qual o sinal de menos?",
}

# List of variables
onready var popup = $WindowDialog
onready var global = $"/root/Global"
onready var listaComandos = Global.listaComandos
onready var estado = global.estado 
var process = true
onready var receptor = get_node("Fundo")
var setas = 1

# Show the question in the popup
func _ready():
	Global.desconto = 0
	Global.coin = 0
	popup.visible = true
	var number = Global.numQuestion
	var question = dict.get(number)
	print(global.numQuestion)
	$WindowDialog/RichTextLabel.text = "Colete todos os lixos da praia"
	$WindowDialog/restart.hide()
	$WindowDialog/Next.hide()
	$"Palmeira-1/AnimationPlayer".play("Palmeira")
	$"Palmeira-2/AnimationPlayer".play("Palmeira")
	$"Palmeira-3/AnimationPlayer".play("Palmeira")
	$"Agua-animada/AnimationPlayer".play("Agua-animada")
	$barco/AnimationPlayer.play("Barco")
	$Arrow/AnimationPlayer.play("setinha")
	$Arrow2/AnimationPlayer.play("setinha2")
	$Arrow3/AnimationPlayer.play("arrow3")
	$Arrow4/AnimationPlayer.play("setinha4")
	$Arrow2.hide()
	$Arrow3.hide()
	$Arrow4.hide()
# Button to go back to the previous scene
func _on_Button2_pressed(): 
	TransitionCanvas.change_scene("res://Main.tscn")

# Show the wining message to the player
func _process(delta):
	if process:
		if Global.coin == 5:
			$Fundo.para_bodin()
			$Fundo/CanvasLayer/Down.disabled = true
			$Fundo/CanvasLayer/Up.disabled = true
			$Fundo/CanvasLayer/Left.disabled = true
			$Fundo/CanvasLayer/Right.disabled = true
			print("entrou")
			$WindowDialog/RichTextLabel.text = ""
			$WindowDialog/RichTextLabel.visible = true
			popup.visible = true
			$WindowDialog/Node2D._on_Pronto_pressed()
			Global.coin == 0
			process = false
			Global.cadeado1 += 1
			$WindowDialog/restart.show()
			$WindowDialog/Next.show()

# Close popup
func _on_closePopup_pressed():
	popup.visible = false
	$WindowDialog/closePopup.disabled = true
	$Arrow.hide()
	$Arrow2.show()

# Number of missing vetors
func _on_Fundo_vetor(comandList):
	$WindowDialog/RichTextLabel.text = "coloque no mínimo 10 vetores, " + String(comandList.size()) + " até agora"
	$WindowDialog/RichTextLabel.visible = true
	popup.visible = true

# Restart the Scene
func _on_restart_pressed():
	TransitionCanvas.change_scene("res://Minigame1.tscn")

func _on_TextureButton_pressed():
	TransitionCanvas.change_scene("res://Main.tscn")



func _on_Fundo_arrow2(direction):
	if setas == 1:
		$Arrow2.hide()
		$Arrow3.show()
		setas += 1

func _on_Fundo_arrow3(direction2):
	if setas == 2:
		$Arrow3.hide()
		$Arrow4.show()
		setas += 1

func _on_Fundo_arrow4(direction3):
	if setas == 3:
		$Arrow4.hide()
		setas = 0
