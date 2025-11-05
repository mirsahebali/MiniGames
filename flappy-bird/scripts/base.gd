extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta * 70

	var window_width: float = get_viewport().size.x
	if position.x + window_width <= 0.0:
		position.x = (window_width * 2) - 18
	pass
