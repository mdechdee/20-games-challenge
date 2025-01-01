extends StaticBody2D

var SPEED = 800.0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_up"):
		move_and_collide(Vector2.UP * SPEED * delta)
	if Input.is_action_pressed("move_down"):
		move_and_collide(Vector2.DOWN * SPEED * delta)
