extends CharacterBody2D

const SPEED = 300
const PADDLE_HEIGHT = 100 # Should match your paddle height

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		input_vector.y = -1
	if Input.is_action_pressed("ui_down"):
		input_vector.y = 1
	
	velocity = input_vector * SPEED
	move_and_slide()
	
	# Keep paddle within screen bounds
	position.y = clamp(position.y, 
					  PADDLE_HEIGHT/2, 
					  get_viewport_rect().size.y - PADDLE_HEIGHT/2)
