extends Node

var score: int = 0

var high_score: int = 0

func get_score()-> int: return score

func inc_score()-> void: score += 1

func reset_score()-> void: score = 0

func set_high_score() -> void:
	if score > high_score: high_score = score
