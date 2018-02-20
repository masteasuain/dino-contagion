extends Area2D

#const speed = 600
var direccion = 0  # 0 arriba, 1 derecha, 2 abajo, 3 izquierda
var distancia = 3
var tile

onready var tilemap_objetos = get_node("/root/game/principal/TileMap/objects")
onready var tilemap_mocos = get_node("/root/game/principal/TileMap/moco")

func _ready():
#	avanzar_tile()
	set_process(true)

func limpiar():	
	get_node("/root/game/UI/play").limpiar(self)

func _process(delta):

	avanzar_tile()	

	if (distancia > 0):		
		
		if (tile.y <= global.ROWS and tile.y >= 0) and (tile.x <= global.COLUMNS and tile.x >= -1):
			var mocoStopScene = load("res://scenes/MocoStop.tscn")
			var mocoStop = mocoStopScene.instance()
			var pos = tilemap_objetos.map_to_world(tile)
			mocoStop.position = Vector2(pos.x + 150, pos.y + 150)
			mocoStop.z_index = 1	
			tilemap_objetos.call_deferred("add_child", mocoStop)
			
			if (tilemap_objetos.get_cellv(tile) in global.bloqueables):			
				distancia = 0
			elif global.dinos_fixed.has(tile):
				var dino = global.dinos_fixed[tile][0]
				dino.estornudar()
				tilemap_mocos.set_cellv(tile, 0)
				distancia = distancia - 1
				print("encontre un dino!")
			else:	
				tilemap_mocos.set_cellv(tile, 0)
				distancia = distancia - 1
	
		else:
			distancia = 0
			queue_free()
	else:
		queue_free()

func avanzar_tile():
	if (direccion == 0):
		tile.y = tile.y - 1
	elif(direccion ==1):
		tile.x = tile.x + 1
	elif(direccion ==2):
		tile.y = tile.y + 1
	elif(direccion ==3):
		tile.x = tile.x - 1

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Node2D_area_entered( area ):
#	if area.get_name() == "dino":
	pass

