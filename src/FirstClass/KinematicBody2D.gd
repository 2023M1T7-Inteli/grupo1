extends KinematicBody2D
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	var vector_movement=Vector2.ZERO
	vector_movement.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	vector_movement.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	
	move_and_slide(vector_movement*500)
	position += vector_movement*delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
