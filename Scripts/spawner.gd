extends Node2D

var pos_array: Array[Vector2]
@export var scenesToSpawn: Array[PackedScene] = [] #Para guardar las escenas empaquetadas desde el programa

func _ready() -> void:
	for child in get_children():
		if(child is Marker2D):
			pos_array.push_back(child.global_position) # añade la posicion de cada hijo (marcador) al array


func _on_timer_timeout() -> void:
	##Aqui crearemos los objetos de forma random sobre las posiciones random
	if pos_array.size() == 0 or scenesToSpawn.size() == 0:
		return
	var pos: Vector2 = pos_array.pick_random()
	var scene: PackedScene = scenesToSpawn.pick_random()
	var new_scene: Node2D = scene.instantiate()
	new_scene.when_my_box_is_appear.connect(_on_rigid_body_2d_when_my_box_is_appear)
	new_scene.global_position=pos
	add_child(new_scene)
	


func _on_rigid_body_2d_when_my_box_is_appear(message: String) -> void:
	print(message)
