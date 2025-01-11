extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
var rotation_speed := -240.0

func _process(delta: float) -> void:
	rotation_degrees += rotation_speed * delta
