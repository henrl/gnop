extends Node

@onready var lives_display = $LivesDisplay
@onready var multiplier_display = $MultiplierDisplay
@onready var score_display = $ScoreDisplay
@onready var ball = $Ball
var game_score = 0
var game_multiplier = 1

func _ready():
	multiplier_display.update_display(game_multiplier)
	score_display.update_display(game_score)
	# Add this to initialize lives
	lives_display.lives_count = 3
	lives_display.update_display()
	# Connect ball's out_of_bounds signal
	ball.out_of_bounds.connect(_on_ball_out_of_bounds)
	ball.add_score.connect(_on_add_score)
	
func _on_ball_out_of_bounds():
	game_multiplier = 1
	multiplier_display.update_display(game_multiplier)
	lives_display.decrease_lives()
	# You may want to add ball respawn logic here later

func _on_add_score(amt):
	game_score += amt * game_multiplier
	game_multiplier += 0.1
	multiplier_display.update_display(game_multiplier)
	score_display.update_display(game_score)
