extends PlayerController

@onready var timer: Timer = Timer.new()
@onready var ball: RigidBody2D
@export var reaction_time: float = .2

var _move_direction: Vector2
var _stop_offset: float

func _ready() -> void:
	get_tree().node_added.connect(_on_scene_tree_node_added)
	_randomize_time()
	timer.timeout.connect(_think)
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	
func _on_scene_tree_node_added(node: Node) -> void:
	# if node added to scene tree is ball
	if node is RigidBody2D:
		ball = node

func _randomize_time() -> void:
	timer.wait_time = max(0.05, randfn(reaction_time, .1))
	_stop_offset = max(0, randfn(5, 1.0))

func _think() -> void:
	if abs(ball.position.y - player.position.y) > _stop_offset * 2.0:
		if ball.position.y > player.position.y:
			_move_direction = Vector2.DOWN
		else:
			_move_direction = Vector2.UP
	else:
		_move_direction = Vector2.ZERO
	_randomize_time()
	timer.start()
	

func _physics_process(delta: float) -> void:
	if ((ball.position.y - player.position.y < _stop_offset and _move_direction == Vector2.UP) or 
		(ball.position.y - player.position.y > _stop_offset and _move_direction == Vector2.DOWN)):
		player.move_and_collide(_move_direction * SPEED * delta)
