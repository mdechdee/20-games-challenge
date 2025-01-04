extends CharacterBody2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _physics_process(delta):
	var collision_data = move_and_collide(velocity * delta)
	if collision_data:
		audio_stream_player.play()
		velocity.y += randf_range(-20, 20)
		velocity = velocity.bounce(collision_data.get_normal())
