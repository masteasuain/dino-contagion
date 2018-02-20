extends ItemList

onready var map = get_node("/root/game/principal/TileMap/objects")
var selectedDino=0 #0:none, 1:left, 2:down, 3:right, 4:up

func _ready():
	pass
	
func _input(event):
	
	if event.is_pressed() and mouseOverTilemap():
#		var mouse_pos = event.position

		var tile = map.world_to_map(map.get_local_mouse_position())

		if (map.get_cellv(tile) == -1) and selectedDino!=0: #if there is nothing on the cell
			var dinoScene = getDino() #put a dino
			var dino = dinoScene.instance()
			print(selectedDino)
			dino.position = Vector2(map.map_to_world(tile).x + 150, map.map_to_world(tile).y + 250)
			map.call_deferred("add_child", dino)
			


func getDino():
	if(selectedDino==1): #left dino
		return load("res://scenes/DinoLeft.tscn")
	elif(selectedDino == 2): #down dino
		return load("res://scenes/DinoFixedFront.tscn")
	elif(selectedDino == 3): #right dino
		return load("res://scenes/DinoFixedRight.tscn")
	elif(selectedDino == 4):
		return load("res://scenes/DinoBack.tscn")
	else: #none selected
		return null

func mouseOverTilemap():
	return (map.world_to_map(map.get_local_mouse_position()).x>-1 and map.world_to_map(map.get_local_mouse_position()).x<10 ) and map.world_to_map(map.get_local_mouse_position()).y>=0
	

func _on_TextureButton_button_down():
	selectedDino=1

func _on_TextureButton2_button_down():
	selectedDino=2

func _on_TextureButton3_button_down():
	selectedDino=3

func _on_TextureButton4_button_down():
	selectedDino=4


