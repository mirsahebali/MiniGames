extends Node2D


# Called when the node enters the scene tree for the first time.
var enemy: CharacterBody2D
func _ready() -> void:
	enemy = get_node("Enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	enemy.position.x -= 70 * delta
