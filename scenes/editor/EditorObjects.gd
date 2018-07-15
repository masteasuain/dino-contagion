extends TileMap

onready var map = get_node("objects")
const Fileloader = preload("FileLoader.gd") # Relative path
onready var file_loader = Fileloader.new()

func _ready():
	file_loader.parseFile()
	var level=file_loader.getLevelMatrix()
	#placeTiles(level,1,1)
	
	var tiles = get_used_cells()
	for pos in tiles:
		
		#get current cell index
		var idx = get_cell(pos.x,pos.y)
				
		#else
		var tgt = map_to_world(pos,false) #get world pos
		tgt = Vector2(tgt.x,tgt.y + 15) #offset to centralize tile
		
		var tile = Vector2(pos.x,pos.y)
	
	set_process(true) #cursor and player interactions
	set_process_input(true) #also cursor and player interactions
	

func ubicarDino(tile, scene):
	
	self.set_cellv(tile,-1)
	var dinoScene = load(scene)
	var dino = dinoScene.instance()		
	dino.z_index = 1
	dino.tile = tile
	dino.position = Vector2(map_to_world(tile).x + 150, map_to_world(tile).y + 250)
	self.call_deferred("add_child", dino)	
	global.dinos_fixed[tile] = [dino]

	
func placeTiles(elementos, columnas, filas):
	var index=0
	var tile=0
	
	for i in range(global.ROWS+1):
		for j in range(global.COLUMNS+2):
			var posicion = Vector2(j-1,i)
			tile=getTile(elementos[index])
			self.set_cellv(posicion, tile)
			index=index+1

func test(x,y):
	var position = Vector2(x,y)
	var tile=3
	self.set_cellv(position, tile)
	
func getTile(elemento):
	match elemento:
		"library":
			return 3
		"pctable":
			return 8
		"plant":
			return 9
		"table":
			return 10
		"tableh1":
			return 11
		"tableh2":
			return 13
		"tableh3":
			return 15
		"dino1":
			return 27
		"dinof":
			return 28
		"dinor":
			return 29
		"dinob":
			return 30
		"dinob2":
			return 31
		_:
			return -1
	
func posicionValida(tile):
	return (tile.y <= global.ROWS and tile.y >= 0) and (tile.x <= global.COLUMNS and tile.x >= -1)

