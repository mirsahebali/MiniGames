extends Node

var score := 0
var score_int:= 0

var high_score := 0

func _process(delta: float) -> void:
	score_int += delta * 100
	score = score_int/5
	high_score = score if score > high_score else high_score
