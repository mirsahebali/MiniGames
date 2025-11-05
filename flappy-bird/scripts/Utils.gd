@tool
extends Node


var label: Label = Label.new()
var restart_game_button: Button = Button.new()

func spawn_game_over() -> void:
	label.z_index = 15
	label.text = "Game Over"
	label.size = Vector2(200, 100)
	label.position = Vector2(get_window().size.x/4.0,10)
	label.visible = true
	label.add_theme_font_size_override("font_size", 32)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	add_sibling(label)

	restart_game_button.z_index = 15
	restart_game_button.text = "Restart Game"
	restart_game_button.visible = true
	restart_game_button.add_theme_font_size_override("font_size", 16)
	restart_game_button.position = Vector2(get_window().size.x/4.0, 80)
	restart_game_button.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	restart_game_button.pressed.connect(_restart_button_pressed)
	add_sibling(restart_game_button)




func _restart_button_pressed()-> void:
	ScoreManager.score = 0

	var bird_node: CharacterBody2D = get_tree().root.get_node("/root/Main/Camera2D/BirdBody")
	bird_node.position.y = 0

	var obstacle_node0: Node2D = get_tree().root.get_node("/root/Main/Camera2D/Obstacles/Obstacle0")	
	obstacle_node0.position.x = StateManager.PipesPos[0].x

	var obstacle_node1: Node2D = get_tree().root.get_node("/root/Main/Camera2D/Obstacles/Obstacle1")	
	obstacle_node1.position.x = StateManager.PipesPos[1].x

	var obstacle_node2: Node2D = get_tree().root.get_node("/root/Main/Camera2D/Obstacles/Obstacle2")	
	obstacle_node2.position.x = StateManager.PipesPos[2].x

	get_parent().remove_child(label)
	get_parent().remove_child(restart_game_button)

	get_tree().paused = false

func randomize_top_y_pos_with_pivot(pivot_y: float) -> float:
	return randf_range(pivot_y - 64, pivot_y + 88)

func randomize_bottom_y_pos_with_pivot(pivot_y: float) -> float:
	return randf_range(pivot_y - 32, pivot_y + 160)
