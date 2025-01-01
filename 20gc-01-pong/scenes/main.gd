extends Node2D

@export var BALL: PackedScene

@onready var ball_spawn: Marker2D = $BallSpawn
@onready var death_zone_left: Area2D = $DeathZoneLeft
@onready var death_zone_right: Area2D = $DeathZoneRight

var ball: RigidBody2D

var player_1_score := 0
var player_2_score := 0

func _ready() -> void:
	_respawn_ball()
	death_zone_left.body_entered.connect(_on_death_zone_body_entered.bind(0))
	death_zone_right.body_entered.connect(_on_death_zone_body_entered.bind(1))


func _respawn_ball() -> void:
	if is_instance_valid(ball):
		ball.queue_free()
		await ball.tree_exited
	ball = BALL.instantiate()
	ball.global_position = ball_spawn.global_position
	add_child(ball)
	await get_tree().create_timer(1.0).timeout
	ball.apply_central_impulse(Vector2.UP.rotated(randf()*PI) * 500.0)


func _process(delta: float) -> void:
	%P1Score.text = str(player_1_score)
	%P2Score.text = str(player_2_score)


func _on_death_zone_body_entered(body: Node2D, is_player_1: bool) -> void:
	# if it's a ball
	if body is RigidBody2D:
		if is_player_1:
			player_1_score += 1
		else:
			player_2_score += 1
		_respawn_ball()
		
