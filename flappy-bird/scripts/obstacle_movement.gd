extends Node2D

const DIFFERENCE_BETWEEN_PIPES: float = 144.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta * 70
	var sprite_width: float = get_meta("pipe_sprite_size", 0.0)

	if position.x + (sprite_width/2.0) <= 0.0:
		var last_node: Node2D = get_last_node()
		position.x = last_node.position.x + DIFFERENCE_BETWEEN_PIPES + (sprite_width/2.0)
		var bottom_pipe: Area2D = get_node("PipeBottom")
		bottom_pipe.position.y = randomize_bottom_y_pos()
		var top_pipe: Area2D  = get_node("PipeTop")
		top_pipe.position.y = randomize_top_y_pos()


func get_current_obstacle_id() -> int:
	return get_meta("id", 0)

func get_last_obstacle_id() -> int:
	var current_obstacle_id: int = get_current_obstacle_id()
	match current_obstacle_id:
		0: return 2
		1: return 0
		2: return 1
		_: return 0
			

func get_last_node() -> Node2D:
	return get_node(str("../Obstacle", get_last_obstacle_id()))


func randomize_top_y_pos() -> float:
	return randf_range(-512, -320)

func randomize_bottom_y_pos() -> float:
	return randf_range(312, 480)
