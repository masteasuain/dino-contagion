extends Control

# objeto seleccionado, -1 indica que no hay seleccion
var dinoSelected = -1

#cantidades de dinos
var dinoFront = 1
var dinoLeft = 0
var dinoRight = 0
var dinoBack = 0

onready var tilemap_objetos = get_node("principal/TileMap/objects")

func _ready():
	# Called when the node is added to the scene for the first time.
	pass

func loadPresetLevel():
	#cargar archivo y setear la cantidad de dinos
	#dinoLeft = 2 ej
	pass
	
func getGameObjects():
	#inspeccionar el tablero y devolver una lista de objectos y posiciones
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_dinoFront_toggled( button_pressed ):
	if button_pressed:
		dinoSelected = 0
	else:
		dinoSelected = -1
		
	print("selected DinoFront")
	pass

func _input(event):
	if event.is_action_released("left_click"):
		var tile = tilemap_objetos.world_to_map(tilemap_objetos.get_local_mouse_position())

		if not global.modo_play and not event.is_echo():
			if posicionValida(tile):
				if (tilemap_objetos.get_cellv(tile) == -1) and (not tile in global.dinos_fixed):
					if dinoSelected == 0 and dinoFront > 0:
						print("insertado")
						"""
						tilemap_objetos.ubicarDino(tile, "res://scenes/DinoFront.tscn")
						dinoFront = dinoFront - 1
						get_node("UI/SFX_click").play()
						"""
		

func posicionValida(tile):
	return (tile.y <= global.ROWS and tile.y >= 0) and (tile.x <= global.COLUMNS and tile.x >= -1)