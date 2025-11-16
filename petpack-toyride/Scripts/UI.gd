extends Control


var pause_menu = preload("res://Scenes/PauseMenu.tscn")


var score_label: Label
var high_score_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_label = get_node("Score")
	high_score_label = get_node("HighScore")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	score_label.text = str("Score: ", ScoreManager.score)
	high_score_label.text = str("High Score: ", ScoreManager.high_score)

func _on_pause_button_down() -> void:
	get_tree().paused = true
	var paused_menu = pause_menu.instantiate()
	add_sibling(paused_menu)

	pass # Replace with function body.

