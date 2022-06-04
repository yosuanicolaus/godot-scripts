extends Node2D

var velocity = Vector2.ZERO
var gravity = Vector2(0, 0.1)
var c = -0.01

onready var screen = get_viewport_rect().size


func _process(_delta):
	var friction = velocity.normalized() * c
	velocity += gravity
	velocity += friction
	position.y += velocity.y

	check_edge()


func check_edge():
	if position.y >= screen.y:
		velocity.y = -velocity.y
