extends CharacterBody2D

func _process(_delta: float) -> void:
	pass




func _on_enemy_area_body_entered(body: Node2D) -> void:
	queue_free()	
	pass # Replace with function body.

