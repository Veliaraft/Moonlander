extends StaticBody2D

onready var camera = get_node("../Camera2D")

func _physics_process(delta):
	position.x = camera.position.x
