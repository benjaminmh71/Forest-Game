class_name  Enemy
extends Entity

func takeAction(grid: Grid):
	grid.move(self, 1, 0)
