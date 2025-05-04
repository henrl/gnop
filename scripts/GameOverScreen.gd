extends Control

@onready var restart_button = $VBoxContainer/RestartButton
@onready var menu_button = $VBoxContainer/MenuButton

func _ready():
	restart_button.pressed.connect(_on_restart_pressed)
	menu_button.pressed.connect(_on_menu_pressed)

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")
