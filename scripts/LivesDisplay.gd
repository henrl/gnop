extends HBoxContainer

@export var lives_count := 3
@export var game_over_screen: PackedScene

func _ready():
	update_display()

func update_display():
	$LivesCount.text = str(lives_count)

func decrease_lives():
	lives_count -= 1
	update_display()
	if lives_count <= 0:
		show_game_over()

func show_game_over():
	var game_over = game_over_screen.instantiate()
	get_tree().current_scene.add_child(game_over)
	get_tree().paused = true
