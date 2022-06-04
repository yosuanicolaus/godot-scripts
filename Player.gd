extends KinematicBody

export var speed = 14
export var gravity = 75
export var jump_impulse = 20
export var bounce_impulse = 16
var velocity = Vector3.ZERO


func _ready():
	pass


func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		print("jump!")
		velocity.y += jump_impulse

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= gravity * delta

	velocity = move_and_slide(velocity, Vector3.UP)
