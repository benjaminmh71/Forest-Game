extends Node

@export var width := 16
@export var height := 8
var grid := []
var tsize = 16
var xOffset = 8
var yOffset = 8

func _ready():
	for i in range(width):
		grid.append([])
		for j in range(height):
			grid[i].append(null)

func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		place(load("res://Entities/Thorn Wall.tscn").instantiate(), 
			(event.position.x-xOffset+tsize/2)/tsize, (event.position.y+tsize/2-yOffset)/tsize)

func place(entity: Entity, x: int, y: int):
	if (x >= width or y >= height): return
	entity.position = Vector2(xOffset+x*tsize, yOffset+y*tsize)
	grid[x][y] = entity
	add_child(entity)
