extends Control

# objeto seleccionado, -1 indica que no hay seleccion
var dinoSelected = -1

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
	get_node("UI/SFX_click").play()
	pass
func _on_dinoLeeft_toggled( button_pressed ):
	if button_pressed:
		dinoSelected = 1
	else:
		dinoSelected = -1
		
	print("selected DinoFront")
	get_node("UI/SFX_click").play()
	pass
	
func _on_dinRigth_toggled( button_pressed ):
	if button_pressed:
		dinoSelected = 2
	else:
		dinoSelected = -1
		
	print("selected DinoFront")
	get_node("UI/SFX_click").play()
	pass	
func _on_dinBack_toggled( button_pressed ):
	if button_pressed:
		dinoSelected = 3
	else:
		dinoSelected = -1
		
	print("selected DinoFront")
	get_node("UI/SFX_click").play()
	pass	


func _input(event):
	if event.is_action_released("left_click"):
		var tile = tilemap_objetos.world_to_map(tilemap_objetos.get_local_mouse_position())

		if not global.modo_play and not event.is_echo():
			if posicionValida(tile):
				if (tilemap_objetos.get_cellv(tile) == -1) and (not tile in global.dinos_fixed):
					if dinoSelected == 0:
						tilemap_objetos.ubicarDino(tile, "res://scenes/DinoFront.tscn")
						get_node("UI/SFX_click").play()
					if dinoSelected == 1:
						tilemap_objetos.ubicarDino(tile, "res://scenes/DinoLeft.tscn")
						get_node("UI/SFX_click").play()
					if dinoSelected == 2:
						tilemap_objetos.ubicarDino(tile, "res://scenes/DinoRight.tscn")
						get_node("UI/SFX_click").play()
					if dinoSelected == 3:
						tilemap_objetos.ubicarDino(tile, "res://scenes/DinoBack.tscn")
						get_node("UI/SFX_click").play()															
					if dinoSelected == 4:
						tilemap_objetos.ubicarDino(tile, "res://scenes/DinoFirst.tscn")
						get_node("UI/SFX_click").play()									

func posicionValida(tile):
	return (tile.y <= global.ROWS and tile.y >= 0) and (tile.x <= global.COLUMNS and tile.x >= -1)


func _on_post_it_toggled(button_pressed):
	pass # Replace with function body.


func _on_dinoMain_toggled(button_pressed):
	if button_pressed:
		dinoSelected = 4
	else:
		dinoSelected = -1
		
	print("selected DinoFront")
	get_node("UI/SFX_click").play()
	pass		
	pass # Replace with function body.
