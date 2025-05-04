extends Node

@onready var lives_display = $LivesDisplay
@onready var score_display = $ScoreDisplay
@onready var ball = $Ball
var game_score = 0

func _ready():
	score_display.update_display(game_score)
	# Add this to initialize lives
	lives_display.lives_count = 3
	lives_display.update_display()
	# Connect ball's out_of_bounds signal
	ball.out_of_bounds.connect(_on_ball_out_of_bounds)
	ball.add_score.connect(_on_add_score)
	
func _on_ball_out_of_bounds():
	lives_display.decrease_lives()
	# You may want to add ball respawn logic here later

func _on_add_score(amt):
	game_score += amt
	score_display.update_display(game_score)
