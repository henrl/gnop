extends Node

@onready var lives_display = $LivesDisplay
@onready var ball = $Ball

func _ready():
	# Add this to initialize lives
	lives_display.lives_count = 3
	lives_display.update_display()
	# Connect ball's out_of_bounds signal
	ball.out_of_bounds.connect(_on_ball_out_of_bounds)
	
func _on_ball_out_of_bounds():
	lives_display.decrease_lives()
	# You may want to add ball respawn logic here later
