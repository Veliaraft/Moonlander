extends KinematicBody2D

var movement = Vector2(0, 0)
var angle = 0

var rotationSpeed = 0.025
var acceleration = 1
var gravity = 0.4

onready var fuelSlider = get_node("../GUI/fuel_level/VSlider")
onready var engineLeft = get_node("CPUParticles2D")
onready var xspeed = get_node("../GUI/X_SPEED/x_speed")
onready var yspeed = get_node("../GUI/Y_SPEED/y_speed")
onready var angleinfo = get_node("../GUI/ANGLE/angle")
var text = load("res://booms/" + str(randi()%5) + ".png")
var in_safe_zone = false
var score_multiplier = 0


func _ready():
	$"../GUI/Score/score".text = str(S.score)
	fuelSlider.value = S.fuel
	movement.x = 1 + randi()%10

func _physics_process(delta):
# warning-ignore:unused_variable
	var col = move_and_collide(movement)
	if col:
		$"../CanvasLayer".visible = false
		var crashed = false
		if not in_safe_zone:
			crashed = true
		else:
			if movement.x > 0.25 or movement.x < -0.25:
				crashed = true
			elif movement.y > 0.3 or movement.y < -0.3:
				crashed = true
			elif angle > 0.1 or angle < -0.1:
				crashed = true
		if crashed:
			var spr = get_node("../Sprite")
			spr.texture = text
			spr.visible = true
			get_node("../AudioStreamPlayer").play()
			if fuelSlider.value > 1:
				get_node("../Timer").start(2)
			else:
				$"../Result/Label3".text = str(S.score)
				$"../Result".visible = true
			queue_free()
		else:
			S.score += 50 * score_multiplier
			$"../GUI/Score/score".text = str(S.score)
			if fuelSlider.value > 1:
				get_tree().change_scene("res://Level.tscn")
			else:
				$"../Result/Label3".text = str(S.score)
				$"../Result".visible = true
				get_tree().paused = true
	if movement.x > 20 or movement.x < -20:
		movement.x = sign(movement.x) * 20
	if movement.y > 20 or movement.y < -20:
		movement.y = sign(movement.y) * 20
	
	movement.y += gravity * delta
	if Input.is_action_pressed('ui_up') and S.fuel > 0:
		movement.x += (acceleration * sin(angle))*delta
		movement.y -= (acceleration * cos(angle))*delta
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("rocket_sound")
		engineLeft.emitting = true
		S.fuel -= 0.3
	elif Input.is_action_just_released("ui_up") or S.fuel < 1:
		if $AnimationPlayer.is_playing():
			$AnimationPlayer.stop()
			$start.stop()
			$mid.stop()
			$end.play()
		engineLeft.emitting = false
	angle += rotationSpeed * int(Input.is_action_pressed("ui_right")) - rotationSpeed *int(Input.is_action_pressed("ui_left"))
	if angle > 6.283 or angle < -6.283:
		angle = 0
	elif angle < 0.1 and angle > -0.1:
		angle -= angle/10
	
	rotation = angle
	fuelSlider.value = S.fuel if S.fuel > 0 else 0
	xspeed.text = str(int(movement.x*10))
	yspeed.text = str(int(movement.y*10*-1))
	angleinfo.text = str(int(angle/0.0175)) + "°"
	if S.fuel < 200 and not $alert.playing:
		$"../CanvasLayer".visible = true
		$alert.play()

func _check_but():
	if Input.is_action_pressed("ui_up"):
		$AnimationPlayer.stop()
		$AnimationPlayer.play("rsnd")
