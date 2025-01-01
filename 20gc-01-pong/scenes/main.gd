extends Node2D

@onready var ball: RigidBody2D = %Ball

func _ready() -> void:
	ball.apply_central_impulse(Vector2.UP.rotated(randf()*PI) * 500.0)
