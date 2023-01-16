extends Camera2D

var zoomed = false

func _physics_process(delta):
	if zoomed:
		if zoom.x > 0.6:
			zoom.x -= 0.01
			zoom.y -= 0.01
	else:
		if zoom.x < 1:
			zoom.x += 0.01
			zoom.y += 0.01

func _on_Area2D_body_entered(body):
	zoomed = true

func _on_Area2D_body_exited(body):
	zoomed = false
