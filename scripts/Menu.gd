extends Control

func _ready():
	$MenuPanel/MarginContainer/ButtonContainer/StartButton.pressed.connect(_on_start_pressed)
	$MenuPanel/MarginContainer/ButtonContainer/QuitButton.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/Main.tscn") # Change this to your game scene

func _on_quit_pressed():
	get_tree().quit()
