extends Node

var number_textures: Array[Texture] = []

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed() and event.keycode == KEY_ESCAPE:
			get_tree().quit(0)

		if event.is_pressed() and event.keycode == KEY_P:
			SettingsManager.paused = !SettingsManager.paused
			get_tree().paused = SettingsManager.paused

func _ready() -> void:
	SettingsManager.running = true

	for i: int in range(10):
		number_textures.push_back(load("res://assets/flappy-bird-assets/sprites/%s.png" % i))
	
func _process(_delta: float) -> void:
	pass
