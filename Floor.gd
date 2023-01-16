extends Node2D

func _ready():
	randomize()
	var childcount = get_node("Node2D/SafeZones").get_child_count()
	for i in range(childcount):
		if randi()%2 == 0:
			get_node("Node2D/SafeZones").get_child(i).monitoring = false
			get_node("Node2D/SafeZones").get_child(i).visible = false
	var floo = get_node("Node2D")
	var rightside = []
	var leftside = []
	for i in range(40):
		rightside.append(floo.duplicate())
		leftside.append(floo.duplicate())
		rightside[i].position.x += 5598.317*i
		leftside[i].position.x -= 5598.317*i
		add_child(rightside[i])
		add_child(leftside[i])
