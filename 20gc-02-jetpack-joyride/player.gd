extends CharacterBody2D

const MOVE_SPEED = 50.0
const X_ACCELERATION = 5.0
const Y_ACCELERATION = 2500.0
const MAX_Y_SPEED = 600.0

var extra_speed: float = 0.0 
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	velocity.x = 100.0

func _physics_process(delta: float) -> void:
	var animation_to_play := &"run"
	velocity.x += X_ACCELERATION * delta
	
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		extra_speed = Input.get_axis("move_left", "move_right") * MOVE_SPEED
		velocity.x += extra_speed
	if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
		velocity.x -= extra_speed
		extra_speed = 0
	
	if Input.is_action_pressed("fly_up"):
		velocity.y -= Y_ACCELERATION * delta
		animation_to_play = &"fly"
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.y = clampf(velocity.y, -MAX_Y_SPEED, MAX_Y_SPEED)
	move_and_slide()
	
	$Label.text = str(velocity)
	
	if animation_player.current_animation != animation_to_play:
		animation_player.play(animation_to_play, .2)
