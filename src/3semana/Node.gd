extends Node

# List of questions
var dict = {
	1: "pergunta1",
	2: "pergunta2",
	3: "pergunta3",
	4: "pergunta4"
}

 # Number of the question
func _ready():
	var number = Global.numQuestion
	var question = dict.get(number)
	$RichTextLabel.text = question



