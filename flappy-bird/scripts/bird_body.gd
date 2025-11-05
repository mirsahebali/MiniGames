extends CharacterBody2D

var bird_jump_timer_started: bool = false
var bird_jump_timer_start: float = 0.0
var total_rotation_applied: float = 0.0

var paused: bool = false

const BIRD_JUMP_ANIMATION_TIME: float = 0.15
const BIRD_UP_ROTATION_ANGLE: float = 20.0
const GRAVITY: float = 300

var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	var animated_sprite: AnimatedSprite2D = get_node("BirdSprite")
	var wings_audio: AudioStreamPlayer = get_node("Wing")
	var swoosh_audio: AudioStreamPlayer = get_node("Swoosh")

	position.y += delta * GRAVITY
	rotation = deg_to_rad(10)
	swoosh_audio.play()
	swoosh_audio.autoplay = true


	if bird_jump_timer_started:
		animated_sprite.play("bird-flap")
		wings_audio.play()
		rotation = deg_to_rad(-10)
		bird_jump_timer_start += delta
		position.y -= delta * 700
		total_rotation_applied -= delta * BIRD_UP_ROTATION_ANGLE
	
	if bird_jump_timer_start >= BIRD_JUMP_ANIMATION_TIME:
		bird_jump_timer_started = false
		bird_jump_timer_start = 0.0
			
	

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_mask == MOUSE_BUTTON_LEFT:
			bird_jump_timer_started = true

	if event is InputEventKey:
		if event.is_pressed() and event.keycode == KEY_SPACE:
			bird_jump_timer_started = true

