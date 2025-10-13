extends Node2D

const MY_BOX = preload("uid://bfjf8722noi2l")

func _ready() -> void:
	var instance = MY_BOX.instantiate()
	instance.when_my_box_is_appear.connect(_on_rigid_body_2d_when_my_box_is_appear)
	add_child(instance)


func _on_rigid_body_2d_when_my_box_is_appear(message: String) -> void:
	print(message)
