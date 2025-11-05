extends Area2D

# in pixels
const DISTANCE_BETWEEN_PIPE: int = 144
const PIPES_PER_SCENE: int = 4

var game_over_label: Resource = load("res://scenes/game_over_label.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var current_node_id: int = get_current_node_id()

	StateManager.PipesPos[current_node_id] = Vector2(position.x, 0)

	var is_bottom: bool = get_meta("is_bottom", false)
	if is_bottom:
		StateManager.PipesTopBottomYPos[current_node_id]["bottom"] = position.y
		var random_y_pos: float = randomize_bottom_y_pos()
		position.y = random_y_pos
	else:
		StateManager.PipesTopBottomYPos[current_node_id]["top"] = position.y
		var random_y_pos: float = randomize_top_y_pos()
		position.y = random_y_pos


	print(StateManager.PipesTopBottomYPos)
	var sprite: Sprite2D = get_child(1,true)

	get_parent().set_meta("pipe_sprite_size", sprite.get_rect().size.x)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func randomize_top_y_pos() -> float:
	return randf_range(position.y - 64, position.y + 88)


func randomize_bottom_y_pos() -> float:
	return randf_range(position.y - 32, position.y + 160)



func _on_body_entered(_body: Node2D) -> void:

	ScoreManager.set_high_score()
	Utils.spawn_game_over()
	get_tree().paused = true

func get_current_node_id() -> int:
	return (name as String).right(-1).to_int()
