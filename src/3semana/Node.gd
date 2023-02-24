extends Node

var dict = {
	1: "pergunta1",
	2: "pergunta2",
	3: "pergunta3",
	4: "pergunta4"
}

func _ready():
	var number = Global.numQuestion # Number of the question
	var question = dict.get(number)
	$RichTextLabel.text = question



