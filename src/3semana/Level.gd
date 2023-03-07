extends KinematicBody2D
# Change name ListaComandos, mover1, mover2, mover3, mover4
var listaComandos = [] # Array where the commands will be saved
var i = 0 # Variable that select the element of the array that will be read
# Variables that controls the moviments of the bode
var mover1 = false 
var mover2 = false
var mover3 = false
var mover4 = false
# Variables that save the initial cordinates of the bode when he start moving
var x
var y

func _ready():
	Global.coin = 0
# Functions that save the buttons pressed and writes in the labem the historic of commands
func _on_Left_pressed():
	if !$Bode/AnimationPlayer.is_playing():
		listaComandos.append("left")
		$Lista.text += "| <-"
		print(listaComandos)

func _on_Right_pressed():
	if !$Bode/AnimationPlayer.is_playing():
		listaComandos.append("right")
		$Lista.text += "| ->"
		print(listaComandos)

func _on_Down_pressed():
	if !$Bode/AnimationPlayer.is_playing():
		listaComandos.append("down")
		$Lista.text += "| v"
		print(listaComandos)

func _on_Up_pressed():
	if !$Bode/AnimationPlayer.is_playing():
		listaComandos.append("up")
		$Lista.text += "| ^"
		print(listaComandos)

# Function that trigger the bode movimentation in the order of the array listaComandos
func _on_lista_pressed():
	# Save the initial position
	x = $Bode.position.x
	y = $Bode.position.y
	# Do not let execute if the number of calls is equal the numbers of elements in the array, not letting the code bug, calling a no existing element
	if i != listaComandos.size():

		# These conditionals makes the i go to the next element and add the direction to the array
		if listaComandos[i] == ("right"):
			i += 1
			mover1 = true

		elif listaComandos[i] == ("left"):
			i += 1
			mover2 = true

		elif listaComandos[i] == ("down"):
			i += 1
			mover3 = true

		elif listaComandos[i] == ("up"):
			i += 1
			mover4 = true

	else:
		$Lista.text = ""
		i = 0
		listaComandos = []

func audio():
	$AudioStreamPlayer.play()

# Function that makes the bode move
func _process(delta):
	# Conditionals that make the bode moves deppending of the direction
	# Right
	#get_node("coin").connect("coletou",self,"audio")
	#$AudioStreamPlayer.play()
	
	if mover1:
		$Bode/AnimationPlayer.play("walkRight")
		$Bode.move_and_slide(80*Vector2(2,0))
		#Conditional that make the bode stop after reach the determined location
		if $Bode.position.x > x + 66 or $Bode.position.x > 370:
			mover1 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()

	# Left
	elif mover2:
		$Bode/AnimationPlayer.play("walkLeft")
		$Bode.move_and_slide(-80*Vector2(2,0))
		if $Bode.position.x < x - 66 or $Bode.position.x < 27:
			mover2 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()

	# Down
	elif mover3:
		$Bode/AnimationPlayer.play("walkRight")
		$Bode.move_and_slide(80*Vector2(0,2))
		if $Bode.position.y > y + 66 or $Bode.position.y > 680:
			mover3 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()

	# Up
	elif mover4:
		$Bode/AnimationPlayer.play("walkRight")
		$Bode.move_and_slide(-80*Vector2(0,2))
		if $Bode.position.y < y - 66 or $Bode.position.y < 85:
			mover4 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()	

