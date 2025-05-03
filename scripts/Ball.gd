extends RigidBody2D

@export var initial_speed: float = 900
@export var bounce_factor: float = 1.0

func _ready():
	# Apply initial velocity at a random angle
	var direction = Vector2.RIGHT.rotated(randf_range(-PI/4, PI/4))
	linear_velocity = direction * initial_speed

func _on_body_entered(body):
	# Increase bounce effect when hitting the player paddle
	print(linear_velocity)
	if body.is_in_group("paddle"):
		linear_velocity *= 1.05  # Slight speed increase on paddle hit
		print(linear_velocity)
