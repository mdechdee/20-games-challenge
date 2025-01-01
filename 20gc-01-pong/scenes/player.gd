extends StaticBody2D

var SPEED = 10.0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_up") and position.y > 58:
		position.y -= SPEED
	if Input.is_action_pressed("move_down") and position.y < 590:
		position.y += SPEED
