extends KinematicBody2D
# Previous bode script, saved for Level 2

# Change name comandList, move1, move2, move3, move4
var comandList = [] # Array where the commands will be saved
var i = 0 # Variable that select the element of the array that will be read
# Variables that controls the moviments of the bode
var move1 = false 
var move2 = false
var move3 = false
var move4 = false
# Variables that save the initial cordinates of the bode when he start moving
var x
var y

func _ready():
	pass

# Functions that save the buttons pressed and writes in the labem the historic of commands
func _on_Left_pressed():
	comandList.append("left")
	print(comandList)

func _on_Right_pressed():
	comandList.append("right")
	print(comandList)

func _on_Down_pressed():
	comandList.append("down")
	print(comandList)

func _on_Up_pressed():
	comandList.append("up")
	print(comandList)

# Function that trigger the bode movimentation in the order of the array comandList
func _on_lista_pressed():
	# Save the initial position
	x = $Bode.position.x
	y = $Bode.position.y
	print(i)
	print(comandList.size())
	# Do not let execute if the number of calls is equal the numbers of elements in the array, not letting the code bug, calling a no existing element
	if i != comandList.size():

		# These conditionals makes the i go to the next element and add the direction to the array
		if comandList[i] == ("right"):
			i += 1
			move1 = true

		elif comandList[i] == ("left"):
			i += 1
			move2 = true

		elif comandList[i] == ("down"):
			i += 1
			move3 = true

		elif comandList[i] == ("up"):
			i += 1
			move4 = true

	else:
		i = 0
		comandList = []

# Function that makes the bode move
func _process(delta):
	# Conditionals that make the bode moves deppending of the direction
	# Right
	if move1:
		$Bode/AnimationPlayer.play("walkRight")
		$Bode.move_and_slide(80*Vector2(2,0))
		#Conditional that make the bode stop after reach the determined location
		if $Bode.position.x > x + 200 or $Bode.position.x > 930:
			move1 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()

	# Left
	elif move2:
		$Bode/AnimationPlayer.play("walkRight")
		$Bode.move_and_slide(-80*Vector2(2,0))
		if $Bode.position.x < x - 200 or $Bode.position.x < 27:
			move2 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()

	# Down
	elif move3:
		$Bode/AnimationPlayer.play("walkRight")
		$Bode.move_and_slide(80*Vector2(0,2))
		if $Bode.position.y > y + 120 or $Bode.position.y > 580:
			move3 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()

	# Up
	elif move4:
		$Bode/AnimationPlayer.play("")
		$Bode.move_and_slide(-80*Vector2(0,2))
		if $Bode.position.y < y - 120 or $Bode.position.y < 30:
			move4 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()	
