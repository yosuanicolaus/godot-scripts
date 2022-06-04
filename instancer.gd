extends Node2D

export(PackedScene) var object
export(int) var count = 10

var dragging = false
var i = 0

onready var screen = get_viewport_rect().size


func _ready():
	randomize()
	for i in count:
		var obj = object.instance()
		var x = screen.x * randf()
		var y = screen.y * randf()
		obj.position = Vector2(x, y)
		obj.rotation = randf() * TAU
		add_child(obj)


func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		dragging = event.pressed
		# var obj = object.instance()
		# obj.position = event.position
		# obj.rotation = randf() * TAU
		# add_child(obj)


func _process(_delta):
	if dragging and i % 5 == 0:
		var obj = object.instance()
		obj.position = get_global_mouse_position()
		obj.rotation = randf() * TAU
		add_child(obj)
	i += 1
