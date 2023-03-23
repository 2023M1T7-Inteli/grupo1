extends Node2D

var ms = 0
var s = 0
var m = 0
var score = 0

func _ready():
	$Bordado.hide() 

func _process(delta):
	ms += 1
	
	if ms > 59:
		s += 1
		ms = 0
		
	if s > 59:
		m += 1
		s = 0
	
	$Tempo.set_text(str(m)+":"+str(s)+":"+str(ms))



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
	
	Global.score += score - Global.desconto 
	set_process(false)
	$Bordado.show()
	$Mensagem.text = "Parabéns! Você conseguiu "+str(score - Global.desconto)+" filés!"

