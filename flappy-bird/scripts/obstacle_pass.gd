extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	ScoreManager.inc_score()
	var point_node: AudioStreamPlayer = get_node("../Point")
	print("Score: ", ScoreManager.get_score())
	point_node.play()
	pass # Replace with function body.

