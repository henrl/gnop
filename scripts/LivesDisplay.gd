extends HBoxContainer

@export var lives_count := 3

func _ready():
	update_display()

func update_display():
	$LivesCount.text = str(lives_count)

func decrease_lives():
	lives_count -= 1
	update_display()
	if lives_count <= 0:
		get_tree().call_group("game", "game_over")
