extends Node2D

export var wander_degree = 45

var next_direction
var wander = deg2rad(wander_degree)

onready var screen = get_viewport_rect().size


func _ready():
	rotation = rand_range(-PI, PI)
	next_direction = rotation

	yield(get_tree().create_timer(randf()), "timeout")
	$DirectionTimer.start()


func _process(delta):
	position += transform.y * 60 * delta
	rotation = lerp_angle(rotation, next_direction, 0.1)
	screen_wrap()


func screen_wrap():
	position.x = wrapf(position.x, 0, screen.x)
	position.y = wrapf(position.y, 0, screen.y)


func _on_DirectionTimer_timeout():
	next_direction = rand_range(rotation - wander, rotation + wander)
