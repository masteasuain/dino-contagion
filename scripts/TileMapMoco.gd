extends TileMap

func _ready():
	pass

# Limpio los moquitos
func limpiar():
	var tiles = get_used_cells()
	for tile in tiles:
		set_cellv(tile, -1)