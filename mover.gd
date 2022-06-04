extends Node2D

export var acceleration = 10
export var max_speed = 10

var velocity = Vector2.ZERO
var rotate_speed = rand_range(-deg2rad(10), deg2rad(10))


func _ready():
	rotation = randf() * PI


func _process(delta):
	var mouse = get_global_mouse_position()
	var direction = mouse - position
	direction = direction.normalized()

	velocity += direction * acceleration * delta
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	velocity.y = clamp(velocity.y, -max_speed, max_speed)

	position += velocity
	rotation += rotate_speed
