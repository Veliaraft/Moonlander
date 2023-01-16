extends Sprite

onready var par = get_node("..")

func _physics_process(delta):
	self.material.set_shader_param("pos", Vector2(par.position.x*delta, par.position.y*delta))
