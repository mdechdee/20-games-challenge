extends Timer

var min_max_wait_time: Vector2 = Vector2(10, 15)

func _ready() -> void:
	timeout.connect(spawn_obstacle)


func spawn_obstacle() -> void:
	pass
	
