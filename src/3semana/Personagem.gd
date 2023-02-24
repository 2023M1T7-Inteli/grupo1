extends KinematicBody2D

var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(0,600)

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"): # Move right when button right is pressed
		$AnimationPlayer.play("Walk_Right")
		velocity.x += 20
	elif Input.is_action_pressed("ui_left"):
		$AnimationPlayer.play("Walk_Left")
		velocity.x -= 20
	elif Input.is_action_pressed("ui_down"):
		$AnimationPlayer.play("Stop_Front")
		velocity.y += 20
	elif Input.is_action_pressed("ui_up"):
		$AnimationPlayer.play("Walk_Up")
		velocity.y -= 20
	else:
		$AnimationPlayer.play("Stop_Front")

	move_and_slide(velocity* 20) # Move the kinematic body
	
	# Don't let the character get out of screen
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
