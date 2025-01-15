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
		place(load("res://Entities/Soldier.tscn").instantiate(), 
			(event.position.x-xOffset+tsize/2)/tsize, (event.position.y+tsize/2-yOffset)/tsize)

func place(entity: Entity, x: int, y: int):
	if (x >= width or y >= height): return
	if (grid[x][y] != null): return
	entity.position = Vector2(xOffset+x*tsize, yOffset+y*tsize)
	entity.gridX = x
	entity.gridY = y
	grid[x][y] = entity
	add_child(entity)

func _on_move_timer_timeout():
	for i in range(width):
		for j in range(height):
			if grid[i][j] != null:
				grid[i][j].takeAction(grid)
