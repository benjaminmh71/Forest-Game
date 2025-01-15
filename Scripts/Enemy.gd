class_name  Enemy
extends Entity

func takeAction(grid: Grid):
	var moveOnX = randi()%2>0
	var dx = randi()%2*2-1 if moveOnX else 0
	var dy = 0 if moveOnX else randi()%2*2-1
	grid.move(self, dx, dy)
