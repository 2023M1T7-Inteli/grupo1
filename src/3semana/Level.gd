extends Node2D
# Emit signal to Minigame1
signal vetor(comandList)
signal arrow2(direction)
signal arrow3(direction2)
signal arrow4(direction3)
var comandList = [] # Array of moviment commands
var i = 0 # Wich element will be read
# Variables of moviment
var mover1 = false
var mover2 = false
var mover3 = false
var mover4 = false
var mover5 = false
# Varibles of control
var comecar = false
var reset = false
var condition = true
var parado = false
# Texture of console arrows
var up = load("res://Imagens/Seta_Up_console.png")
var down = load("res://Imagens/Seta_Down_console.png")
var left = load("res://Imagens/Seta_Left_console.png")
var right = load("res://Imagens/Seta_Right_console.png")
# Save the initial cordinates of the bode
var x
var y
var in1 = false
# Reset the number of coins
func _ready():
	Global.coin = 0
	$Bode/AnimationPlayer.play("Stop")
# Functions that apped vetors in the array
func _on_Left_pressed():
	if !(mover1 or mover2 or mover3 or mover4):
		comandList.append("left")
func _on_Right_pressed():
	if !(mover1 or mover2 or mover3 or mover4):
		comandList.append("right")
		emit_signal("arrow2", "right")
func _on_Down_pressed():
	if !(mover1 or mover2 or mover3 or mover4):
		comandList.append("down")
func _on_Up_pressed():
	if !(mover1 or mover2 or mover3 or mover4):
		comandList.append("up")
		emit_signal("arrow3", "up")
# Read the movemnt array
func _on_lista_pressed():
	emit_signal("arrow4", "lista")
	$CanvasLayer/Rodar.disabled = true
	if comecar:
		reset = true
		# Save the initial position
		x = $Bode.position.x
		y = $Bode.position.y
# Do not let call a non existent element in the erray
		if i != comandList.size() and !mover1 and !mover2 and !mover3 and !mover4:
			condition = true
			# Conditionals that activate the bode moviment
			if comandList[i] == ("right"):
				i += 1
				mover1 = true
				$AudioStreamPlayer.play()
			elif comandList[i] == ("left"):
				i += 1
				mover2 = true
				$AudioStreamPlayer.play()
			elif comandList[i] == ("down"):
				i += 1
				mover3 = true
				$AudioStreamPlayer.play()
			elif comandList[i] == ("up"):
				i += 1
				mover4 = true
				$AudioStreamPlayer.play()
# Reset the func for another set of moviments
		else:
			i = 0
			comandList = []
			$CanvasLayer/Rodar.disabled = false
			comecar = false
			$Bode/AnimationPlayer.play("Stop")
			for j in range(15):
				get_node("Sprite"+str(j)).texture = null
# Emit signal for Minigame1
	else:
		emit_signal("vetor", comandList)
# Reset console for another set of movements
	if reset:
		if i == comandList.size() and Global.coin != 5 and ! condition:
			comandList = []
			for j in range(15):
				get_node("Sprite"+str(j)).texture = null

	# Function that makes the bode move
func _process(delta):
# Append the arrows at the console
	if len(comandList)<=15:
		for j in range(len(comandList)):
			if comandList[j]=="up":
				get_node("Sprite"+str(j)).texture = up
			elif comandList[j]=="left":
				get_node("Sprite"+str(j)).texture = left
			elif comandList[j]=="right":
				get_node("Sprite"+str(j)).texture = right
			elif comandList[j]=="down":
				get_node("Sprite"+str(j)).texture = down
# Move right
	if mover1:
		$Bode/AnimationPlayer.play("walkRight")
		$Bode.move_and_slide(80*Vector2(2,0))
		#Conditional that make the bode stop after reach the determined location
		if $Bode.position.x > x + 72 or $Bode.get_slide_collision(0)!=null:
			$Bode.position.x -= 5
			mover1 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()
			condition = false
# Move left
	elif mover2:
		
		$Bode/AnimationPlayer.play("walkLeft")
		$Bode.move_and_slide(-80*Vector2(2,0))
		if $Bode.position.x < x - 72 or $Bode.get_slide_collision(0)!=null:
			$Bode.position.x += 5
			mover2 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()
			condition = false
			
# Move down
	elif mover3:
		
		$Bode/AnimationPlayer.play("walkLeft")
		$Bode.move_and_slide(80*Vector2(0,2))
		if $Bode.position.y > y + 72 or $Bode.get_slide_collision(0)!=null:
			$Bode.position.y -= 5
			mover3 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()
			condition = false
# Move up
	elif mover4:
		
		$Bode/AnimationPlayer.play("walkup")
		$Bode.move_and_slide(-80*Vector2(0,2))
		if $Bode.position.y < y - 72 or $Bode.get_slide_collision(0) != null:
			$Bode.position.y += 5
			mover4 = false
			$Bode/AnimationPlayer.stop()
			_on_lista_pressed()	
			condition = false
			
# Let the game start
	if comandList.size() <= 15:
		comecar = true


func _on_Area2D_area_entered(area):
	if area.is_in_group("garrafa"):
		Global.garrafa += 1
	if area.is_in_group("coin"):
		$AudioStreamPlayer2.play()
	if area.is_in_group("pilha"):
		Global.pilha += 1
	if area.is_in_group("maca"):
		Global.maca += 1
	if area.is_in_group("desconto"):
		Global.desconto += 200
		
func para_bodin():
	i = comandList.size()
