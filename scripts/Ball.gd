extends RigidBody2D

signal add_score(amount)
signal out_of_bounds

@export var initial_speed: float = 900
@export var bounce_factor: float = 1.0
@onready var initial_position := position
@onready var respawn_timer := $RespawnTimer

func _ready():
	respawn_timer.timeout.connect(_on_respawn_timer_timeout)
	# Apply initial velocity at a random angle
	var direction = Vector2.RIGHT.rotated(randf_range(-PI/4, PI/4))
	linear_velocity = direction * initial_speed

func _on_body_entered(body):
	var amt = 20
	if body.is_in_group("paddle"):
		amt = 100
		if linear_velocity.length() < 500:
			apply_central_impulse(linear_velocity.normalized() * 10)
		if abs(linear_velocity.normalized().y) > 0.7:
			apply_central_impulse(Vector2(50, 0))
	emit_signal("add_score", amt)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	rotation_degrees = 0

func _on_visible_on_screen_notifier_2d_screen_exited():
	emit_signal("out_of_bounds")
	respawn_timer.start()

func _on_respawn_timer_timeout():
	position = initial_position
	var direction = Vector2.RIGHT.rotated(randf_range(-PI/4, PI/4))
	linear_velocity = direction * initial_speed
	angular_velocity = 0
