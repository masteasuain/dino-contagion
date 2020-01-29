extends Node2D

var direccion = 1  # 0 arriba, 1 derecha, 2 abajo, 3 izquierda
var distancia = 3
var tile
var moqueado = false
var fixed = false

onready var tilemap_objetos = get_node("/root/game/principal/TileMap/objects")

func _ready():
	pass

func dispararMoco():
	if not moqueado:
		moqueado = true
		var mocoScene = load("res://scenes/Moco.tscn")
		var moco = mocoScene.instance()	
		
#		avanzar_tile()
#		var local_pos = tilemap_objetos.map_to_world(tile)
#		moco.position = tilemap_objetos.map_to_world(tile)

		if (direccion == 0):
			moco.position.y = -250
		elif(direccion ==1):
			moco.position.y = -100
			moco.position.x = 100
		elif(direccion ==2):
			moco.position.y = 100
		elif(direccion ==3):
			moco.position.x = -100
				
		moco.direccion = self.direccion
		moco.distancia = self.distancia
		moco.tile = self.tile
		self.call_deferred("add_child", moco)

func estornudar():	
	if (not moqueado) and (get_node("Sprite/Anim").current_animation == "idle"):
		get_node("Sprite/Anim").play("sneeze")
		

func avanzar_tile():
	if (direccion == 0):
		tile.y = tile.y - 1
	elif(direccion ==1):
		tile.x = tile.x + 1
	elif(direccion ==2):
		tile.y = tile.y + 1
	elif(direccion ==3):
		tile.x = tile.x - 1

func reset():
	get_node("Sprite/Anim").current_animation =	"idle"
	moqueado = false
	print("reseteo el dino")
