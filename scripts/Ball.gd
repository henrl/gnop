extends RigidBody2D

@export var initial_speed: float = 900
@export var bounce_factor: float = 1.0

func _ready():
	# Apply initial velocity at a random angle
	var direction = Vector2.RIGHT.rotated(randf_range(-PI/4, PI/4))
	linear_velocity = direction * initial_speed

func _on_body_entered(body):
	if body.is_in_group("paddle"):
		if linear_velocity.length() < 500:
			apply_central_impulse(linear_velocity.normalized() * 10)
		if abs(linear_velocity.normalized().y) > 0.7:
			apply_central_impulse(Vector2(50, 0))

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	rotation_degrees = 0
