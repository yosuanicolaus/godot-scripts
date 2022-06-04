extends KinematicBody

export var min_speed = 10
export var max_speed = 18

var velocity = Vector3.ZERO


func _ready():
	pass


func initialize(start_position, player_position):
	look_at_from_position(start_position, player_position, Vector3.UP)
	rotate_y(rand_range(-PI / 4, PI / 4))

	var speed = rand_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)


func _physics_process(_delta):
	velocity = move_and_slide(velocity)


func _on_VisibilityNotifier_screen_exited():
	queue_free()
