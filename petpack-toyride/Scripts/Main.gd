extends Node2D

const MOVEMENT_SPEED: float = 300.0

var obstacle_scene: PackedScene = preload("res://Scenes/Obstacle.tscn")
var enemy_scene: PackedScene = preload("res://Scenes/Enemy.tscn")

var enemies: Array[CharacterBody2D] 
var obstacles: Array[StaticBody2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemies = [
		spawn_random_enemy(),
		spawn_random_enemy(),
		spawn_random_enemy(),
		spawn_random_enemy(),
		spawn_random_enemy(),
	]

	obstacles = [
		spawn_random_obstacle(),
		spawn_random_obstacle(),
		spawn_random_obstacle(),
		spawn_random_obstacle(),
		spawn_random_obstacle(),
	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_enemies(delta)
	move_obstacles(delta)

# move and respawn new obstacles
func move_obstacles(delta: float) -> void:
	for i in range(0, 5): 
		var obstacle := obstacles[i]
		if !is_instance_valid(obstacle):
			if Utils.toss():
				obstacles[i] = spawn_random_obstacle()	
			continue
		obstacle.position.x -= MOVEMENT_SPEED * delta
		if obstacle.position.x <= 0:
			obstacle.queue_free()

# Move enemy position
func move_enemies(delta: float) -> void:
	for i in range(0, 5): 
		var enemy := enemies[i]
		if !is_instance_valid(enemy):
			if Utils.toss():
				enemies[i] = spawn_random_enemy()	
			continue
		enemy.position.x -= MOVEMENT_SPEED * delta
		if enemy.position.x <= 0:
			enemy.queue_free()
	
func spawn_random_enemy() -> CharacterBody2D:
	var new_enemy: CharacterBody2D  = enemy_scene.instantiate()
	new_enemy.position.y = randf_range(288, 352)
	new_enemy.position.x = get_viewport_rect().size.x + randf_range(10, 1000) 

	add_child(new_enemy)
	return new_enemy


func spawn_random_obstacle() -> StaticBody2D:
	var obstacle: StaticBody2D = obstacle_scene.instantiate()
	obstacle.position.x = get_viewport_rect().size.x + randf_range(10, 1000) 
	obstacle.position.y = randi_range(32, 344)

	obstacle.rotate(deg_to_rad(randf_range(0, 90)))

	add_child(obstacle)
	return obstacle
