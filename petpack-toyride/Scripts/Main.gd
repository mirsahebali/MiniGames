extends Node2D

const ENEMY_MOVEBACK_SPEED: float = 500.0

var obstacle_scene: PackedScene = preload("res://Scenes/Obstacle.tscn")
var scene_enemy: PackedScene = preload("res://Scenes/Enemy.tscn")
# Called when the node enters the scene tree for the first time.
# var enemy: CharacterBody2D

var enemies: Array[CharacterBody2D] 
var initial_enemy_pos: Vector2

func _ready() -> void:
	enemies = [
		spawn_random_enemy(),
		spawn_random_enemy(),
		spawn_random_enemy(),
	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	# Move enemy position
	for i in range(0, 3): 
		var enemy := enemies[i]
		if !is_instance_valid(enemy):
			continue
		enemy.position.x -= ENEMY_MOVEBACK_SPEED * delta
		if enemy.position.x <= 0:
			enemy.queue_free()

func spawn_random_enemy() -> CharacterBody2D:
	var new_enemy: CharacterBody2D  = scene_enemy.instantiate()
	new_enemy.position.y = randf_range(288, 352)
	new_enemy.position.x = get_viewport_rect().size.x

	add_child(new_enemy)
	return new_enemy


func spawn_random_obstacle() -> StaticBody2D:
	var obstacle: StaticBody2D = obstacle_scene.instantiate()
	obstacle.position.x = get_viewport_rect().size.x + 10
	obstacle.position.y = randi_range(32, 344)

	obstacle.rotate(deg_to_rad(randf_range(0, 90)))

	return obstacle
