extends Node2D


func _process(_delta):
	var i = randi() % 4

	if i == 0:
		position.x += 1
	elif i == 1:
		position.x -= 1
	elif i == 2:
		position.y += 1
	else:
		position.y -= 1
