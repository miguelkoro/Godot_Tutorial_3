extends RigidBody2D

@export var force: int = 0

signal when_my_box_is_appear(message: String)

func _ready() -> void:
	when_my_box_is_appear.emit("Appear")
