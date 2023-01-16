extends Area2D

func _on_Area2D2_body_entered(body):
	body.in_safe_zone = true
	body.score_multiplier = 4

func _on_Area2D2_body_exited(body):
	body.in_safe_zone = false
	body.score_multiplier = 0
