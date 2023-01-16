extends Spatial

func _ready():
	if get_tree().paused == true:
		get_tree().paused = false
	$AnimationPlayer.play("Start")

func _on_PLAY_pressed():
	var play_sound = load("res://MainMenu/play.sfxr")
	$AudioStreamPlayer.stream = play_sound
	$AudioStreamPlayer.play()
	S.score = 0
	S.fuel = 1000
	$AnimationPlayer.play("Play")

func _on_EXIT_pressed():
	get_tree().quit()

func _on_PLAY_mouse_entered():
	$AudioStreamPlayer.play()

func _on_EXIT_mouse_entered():
	$AudioStreamPlayer.play()

func _play():
	get_tree().change_scene("res://Level.tscn")

func _on_Close_pressed():
	$CanvasLayer2.visible = false
	$AudioStreamPlayer.play()


func _on_HOW_TO_PLAY_pressed():
	$CanvasLayer2.visible = true
	$AudioStreamPlayer.play()
