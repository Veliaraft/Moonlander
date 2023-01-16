extends CanvasLayer

func _on_EXIT_pressed():
	get_tree().quit()

func _on_RESTART_pressed():
	S.score = 0
	S.fuel = 1000
	get_tree().paused = false
	get_tree().change_scene("res://Level.tscn")

func _on_MAIN_MENU_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://MainMenu/MainMenu.tscn")

func _on_RESUME_pressed():
	get_tree().paused = false
	visible = false
