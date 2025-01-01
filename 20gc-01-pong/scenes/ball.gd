extends RigidBody2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	max_contacts_reported = 1
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body: Node) -> void:
	audio_stream_player.play()
