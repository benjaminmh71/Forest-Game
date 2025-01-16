class_name Grid
extends Node

@export var width := 17
@export var height := 7
var grid := []
var tsize = 16
var xOffset = 24
var yOffset = 8

func _ready():
	for i in range(width):
		grid.append([])
		for j in range(height):
			grid[i].append(null)

func _input(event):
	if event is InputEventMouseButton:
		place(load("res://Entities/Soldier.tscn").instantiate(), 
			(event.position.x-xOffset+tsize/2)/tsize, (event.position.y+tsize/2-yOffset)/tsize)

func place(entity: Entity, x: int, y: int):
	if (x >= width or y >= height
		or x < 0 or y < 0): return
	if (grid[x][y] != null): return
	entity.gridX = x
	entity.gridY = y
	entity.position = Vector2(xOffset+x*tsize, yOffset+y*tsize)
	grid[x][y] = entity
	add_child(entity)

func move(entity: Entity, dx: int, dy: int):
	if (entity.gridX+dx >= width or entity.gridY+dy >= height
		or entity.gridX+dx < 0 or entity.gridY+dy < 0): return
	if (grid[entity.gridX+dx][entity.gridY+dy] != null): return
	grid[entity.gridX][entity.gridY] = null
	entity.gridX += dx
	entity.gridY += dy
	entity.position = Vector2(xOffset+entity.gridX*tsize, yOffset+entity.gridY*tsize)
	grid[entity.gridX][entity.gridY] = entity

func _on_move_timer_timeout():
	for entity in get_children():
		if !(entity is Entity): continue
		entity.takeAction(self)
