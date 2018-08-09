extends Control

# Cantidades de los dinos
var dinoFront = 2
var dinoLeft = 1
var dinoRight = 4
var dinoBack = 3

var mocos
var dinos
var jefe
var popups
const Fileloader = preload("FileLoader.gd") # Relative path
onready var file_loader = Fileloader.new()
onready var tilemap_objetos = get_node("principal/TileMap/objects")

var dinoSelected = -1
		
func _ready():
	print (global.dinos_fixed)
	global.reload= false
	file_loader.parseFile()
	var level=file_loader.getLevelMatrix()
	print (file_loader.getLevelDinor())
	dinoRight = int(file_loader.getLevelDinor())
	dinoLeft = int(file_loader.getLevelDinol())
	dinoFront = int(file_loader.getLevelDinod()	)
	dinoBack = int(file_loader.getLevelDinou()	)
	if (global.level_selected==1):
		var intro = load("res://scenes/PopupIntro.tscn")
		get_node("popups").call_deferred("add_child", intro.instance())
	
	set_process(true)

func _process(delta):
	if global.reload:
		print ("ALGOOOO")
		global.level_selected=global.level_selected+1
		_ready()
	if Input.is_key_pressed(KEY_ESCAPE):
      get_tree().change_scene("res://scenes/MainMenu.tscn")
	
	if global.modo_play:
		mocos = get_tree().get_nodes_in_group("moco").size()
		dinos = get_tree().get_nodes_in_group("dino")		
		jefe = get_tree().get_nodes_in_group("boss")[0]
		popups = get_tree().get_nodes_in_group("popup").size()
		
		get_tree().get_root().get_node("game/UI/play").visible = false
		get_tree().get_root().get_node("game/UI/abort").visible = true
	
		get_node("UI/DinoSelector_1/post_it").disabled = true
		get_node("UI/DinoSelector_2/post_it").disabled = true
		get_node("UI/DinoSelector_3/post_it").disabled = true
		get_node("UI/DinoSelector_4/post_it").disabled = true
				
		var jefeMoqueado = (jefe.get_node("Sprite/Anim").current_animation == "ill")
		
		var dinos_estornudando = 0
		for dino in dinos:
			if dino.get_node("Sprite/Anim").current_animation == "sneeze":
				dinos_estornudando = dinos_estornudando + 1
				
		if (mocos == 0) and (dinos_estornudando == 0) and not jefeMoqueado and popups == 0:
			print("perdiste")
			retry()
	else:
		get_tree().get_root().get_node("game/UI/play").visible = true
		get_tree().get_root().get_node("game/UI/abort").visible = false
		
		get_node("UI/DinoSelector_1/counter").set_text(str(dinoFront))
		if dinoFront == 0:
			get_node("UI/DinoSelector_1/post_it").disabled = true
		else:
			get_node("UI/DinoSelector_1/post_it").disabled = false
			
		get_node("UI/DinoSelector_2/counter").set_text(str(dinoLeft))
		if dinoLeft == 0:
			get_node("UI/DinoSelector_2/post_it").disabled = true
		else:
			get_node("UI/DinoSelector_2/post_it").disabled = false
			
		get_node("UI/DinoSelector_3/counter").set_text(str(dinoRight))
		if dinoRight == 0:
			get_node("UI/DinoSelector_3/post_it").disabled = true
		else:
			get_node("UI/DinoSelector_3/post_it").disabled = false
			
		get_node("UI/DinoSelector_4/counter").set_text(str(dinoBack))
		if dinoBack == 0:
			get_node("UI/DinoSelector_4/post_it").disabled = true
		else:
			get_node("UI/DinoSelector_4/post_it").disabled = false
			
		
			
func modoPlay():
	global.modo_play = true
	get_node("UI/play/musiquita").stop()
	get_node("UI/play/musiquita_play").play()	

func modoEdit():
	get_node("principal/TileMap/moco").limpiar()
	
	for dino in dinos:
		dino.reset()
		
	global.modo_play = false
	get_node("UI/play/musiquita").play()
	get_node("UI/play/musiquita_play").stop()	

func retry():
	var retry = load("res://scenes/PopupRetry.tscn")
	get_node("popups").call_deferred("add_child", retry.instance())

func win():
	global.modo_play = false
	global.reload= true
	global.dinos_fixed = {}
	var win = load("res://scenes/PopupWin.tscn")
	get_node("popups").call_deferred("add_child", win.instance())
	

func _on_dinoFront_toggled( button_pressed ):
	if button_pressed:
		dinoSelected = 0
	else:
		dinoSelected = -1
	
	get_node("UI/SFX_click").play()
	get_node("UI/DinoSelector_2/post_it").pressed = false
	get_node("UI/DinoSelector_3/post_it").pressed = false
	get_node("UI/DinoSelector_4/post_it").pressed = false


func _on_dinoLeft_toggled( button_pressed ):
	if button_pressed:
		dinoSelected = 1
	else:
		dinoSelected = -1
	
	get_node("UI/SFX_click").play()
	get_node("UI/DinoSelector_1/post_it").pressed = false
	get_node("UI/DinoSelector_3/post_it").pressed = false
	get_node("UI/DinoSelector_4/post_it").pressed = false


func _on_dinoRight_toggled( button_pressed ):
	if button_pressed:
		dinoSelected = 2
	else:
		dinoSelected = -1
	
	get_node("UI/SFX_click").play()
	get_node("UI/DinoSelector_1/post_it").pressed = false
	get_node("UI/DinoSelector_2/post_it").pressed = false
	get_node("UI/DinoSelector_4/post_it").pressed = false


func _on_dinoBack_toggled( button_pressed ):
	if button_pressed:
		dinoSelected = 3
	else:
		dinoSelected = -1		
	
	get_node("UI/SFX_click").play()
	get_node("UI/DinoSelector_1/post_it").pressed = false
	get_node("UI/DinoSelector_2/post_it").pressed = false
	get_node("UI/DinoSelector_3/post_it").pressed = false


func _input(event):
	
	var tile = tilemap_objetos.world_to_map(tilemap_objetos.get_local_mouse_position())

	if not global.modo_play:
		if event.is_action_released("left_click") and not event.is_echo():			
			
			if posicionValida(tile):
				if (tilemap_objetos.get_cellv(tile) == -1) and (not tile in global.dinos_fixed):
					if dinoSelected == 0 and dinoFront > 0:
						tilemap_objetos.ubicarDino(tile, "res://scenes/DinoFront.tscn")
						dinoFront = dinoFront - 1
						get_node("UI/SFX_click").play()
					elif dinoSelected == 1 and dinoLeft > 0:
						tilemap_objetos.ubicarDino(tile, "res://scenes/DinoLeft.tscn")
						dinoLeft = dinoLeft - 1
						get_node("UI/SFX_click").play()
					elif dinoSelected == 2 and dinoRight > 0:
						tilemap_objetos.ubicarDino(tile, "res://scenes/DinoRight.tscn")
						dinoRight = dinoRight - 1
						get_node("UI/SFX_click").play()
					elif dinoSelected == 3 and dinoBack > 0:
						tilemap_objetos.ubicarDino(tile, "res://scenes/DinoBack.tscn")
						dinoBack = dinoBack - 1
						get_node("UI/SFX_click").play()
	#			else:
	#				if dinoSelected != -1:
	#					get_node("UI/SFX_error").play()
				elif (tilemap_objetos.get_cellv(tile) != -1) and (dinoSelected > -1):
					get_node("UI/SFX_error").play()
						
#		elif Input.is_action_just_pressed("right_click"):
				elif global.dinos_fixed.has(tile):
					if global.dinos_fixed[tile][0].fixed == false:
						var direccion = global.dinos_fixed[tile][0].direccion
						if direccion == 0:
							dinoBack = dinoBack + 1
							dinoSelected = 3
							get_node("UI/DinoSelector_1/post_it").pressed = false
							get_node("UI/DinoSelector_2/post_it").pressed = false
							get_node("UI/DinoSelector_3/post_it").pressed = false
							get_node("UI/DinoSelector_4/post_it").pressed = true
						elif direccion == 1:
							dinoRight = dinoRight + 1
							dinoSelected = 2
							get_node("UI/DinoSelector_1/post_it").pressed = false
							get_node("UI/DinoSelector_2/post_it").pressed = false
							get_node("UI/DinoSelector_3/post_it").pressed = true
							get_node("UI/DinoSelector_4/post_it").pressed = false
						elif direccion == 2:
							dinoFront = dinoFront + 1
							dinoSelected = 0
							get_node("UI/DinoSelector_1/post_it").pressed = true
							get_node("UI/DinoSelector_2/post_it").pressed = false
							get_node("UI/DinoSelector_3/post_it").pressed = false
							get_node("UI/DinoSelector_4/post_it").pressed = false
						elif direccion == 3:
							dinoLeft = dinoLeft + 1
							dinoSelected = 1
							get_node("UI/DinoSelector_1/post_it").pressed = false
							get_node("UI/DinoSelector_2/post_it").pressed = true
							get_node("UI/DinoSelector_3/post_it").pressed = false
							get_node("UI/DinoSelector_4/post_it").pressed = false
						global.dinos_fixed[tile][0].queue_free()
						global.dinos_fixed.erase(tile)
						tilemap_objetos.set_cellv(tile, -1)
						get_node("UI/SFX_click").play()
						
func posicionValida(tile):
	return (tile.y <= global.ROWS and tile.y >= 0) and (tile.x <= global.COLUMNS and tile.x >= -1)