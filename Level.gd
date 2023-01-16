extends Node2D


func _on_Timer_timeout():
	get_tree().change_scene("res://Level.tscn")

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if $Result.visible == false:
			print("yep")
			var menu = $Control
			var pause_state = not get_tree().paused
			menu.visible = pause_state
			get_tree().paused = pause_state

func _on_Button_pressed():
	get_tree().change_scene("res://MainMenu/MainMenu.tscn")
