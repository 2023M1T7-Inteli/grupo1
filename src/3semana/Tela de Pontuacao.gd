extends Node2D
# Variables of time and score
var ms = 0
var s = 0
var m = 0
var score = 0

# Hides the image of bordado filé
func _ready():
	$Bordado.hide() 

# Make the timer work
func _process(delta):
	ms += 1
	
	if ms > 59:
		s += 1
		ms = 0
		
	if s > 59:
		m += 1
		s = 0
	
	$Tempo.set_text(str(m)+":"+str(s)+":"+str(ms))


# Set the score based in the timer
func _on_Pronto_pressed():
	if m <= 1:
		score = 1000
	elif m <= 2:
		score = 800
	elif m <= 3:
		score = 600
	elif m <= 4:
		score = 400
	else:
		score = 200
	
	# Record the score in the global and show in the screen how much  score you got
	Global.score += score - Global.desconto 
	set_process(false)
	$Bordado.show()
	$Mensagem.text = "Parabéns! Você conseguiu "+str(score - Global.desconto)+" filés!"

