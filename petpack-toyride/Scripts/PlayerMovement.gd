extends CharacterBody2D


const SPEED: float = 300.0
const JUMP_VELOCITY: float = -300.0
const BULLET_VELOCITY: float = 50.0

var bullets: Resource = preload("res://Scenes/Bullets.tscn")

var fired_bullet: bool = false

func _ready() -> void:
	position.x = get_viewport_rect().size.x/5
	pass



func _physics_process(delta: float) -> void:

	motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		shoot_bullets()


	move_and_slide()

func shoot_bullets():
	var new_bullet_l: RigidBody2D = bullets.instantiate()

	new_bullet_l.name = "Bullet"+Utils.gen_unique_string(5)
	new_bullet_l.position = position
	new_bullet_l.linear_velocity.x = randf_range(-100, 100)
	add_sibling(new_bullet_l)
