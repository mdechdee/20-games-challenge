extends PlayerController

@export_range(1,2) var player_number: int = 1

func _physics_process(delta: float) -> void:
	var move: Vector2
	if player_number == 1:
		move = Input.get_axis("p1_move_down", "p1_move_up") * Vector2.UP
	else:
		move = Input.get_axis("p2_move_down", "p2_move_up") * Vector2.UP
	player.move_and_collide(move * SPEED * delta)
