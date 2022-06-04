extends Node2D

var blink = true
const board = []
const pieces = []
const fen_start = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"

export var cell_size = 40

onready var white = $WhitePanel
onready var black = $BlackPanel


# Called when the node enters the scene tree for the first time.
func _ready():
	white.rect_size = Vector2(cell_size, cell_size)
	black.rect_size = Vector2(cell_size, cell_size)

	for i in 8:
		board.append([])
		pieces.append([])
		for j in 8:
			board[i].append(blink)
			pieces[i].append(null)
			blink = !blink
		blink = !blink

	load_fen_position(fen_start)


func load_fen_position(fen: String):
	# var i = 0
	# var j = 0
	for ch in fen:
		pass


func _process(_delta):
	render_board()


func render_board():
	var pointer = Vector2(0, 0)
	# var i = 0
	# var j = 0
	for arr in board:
		for bools in arr:
			var cell: ColorRect
			if bools:
				cell = white.duplicate()
			else:
				cell = black.duplicate()

			cell.rect_position = pointer
			cell.visible = true
			add_child(cell)
			pointer.x += cell_size
			# j += 1
		pointer.x = 0
		pointer.y += cell_size
		# i += 1
