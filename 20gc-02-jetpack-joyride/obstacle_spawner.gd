extends Timer


@export var obstacle_scenes: Array[PackedScene] = []
var min_max_wait_time: Vector2 = Vector2(10, 15)


func _ready() -> void:
	timeout.connect(spawn_obstacle)


func spawn_obstacle() -> void:
	wait_time = randf_range(min_max_wait_time.x, min_max_wait_time.y)
	var scene = obstacle_scenes.pick_random()
	var obstacle = scene.instantiate() as Node2D
	var player = get_tree().get_first_node_in_group("player") as Node2D
	obstacle.global_position = Vector2(Constants.OFFSCREEN_X, randf_range(0, Constants.GROUND_Y))
	obstacle.global_position.x += player.global_position.x
	get_tree().current_scene.add_child(obstacle)
	
