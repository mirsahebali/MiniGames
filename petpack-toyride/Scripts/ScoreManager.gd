extends Node

var score := 0

var high_score := 0

func _process(delta: float) -> void:
	score += (delta * 100) as int
	print(score)
	high_score = score if score > high_score else high_score
