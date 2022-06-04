"""
(owner) Node2D {
	Node*
}
"""
extends Node


func _process(_delta):
	var screen = get_viewport().size
	owner.position.x = wrapf(owner.position.x, 0, screen.x)
	owner.position.y = wrapf(owner.position.y, 0, screen.y)
