extends Node2D

var curtgt = Vector2() #to be parsed
var grid = {}

#Draw a selected Square around a cell
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	update() 
	
func _draw():
	if (get_tree().get_nodes_in_group("popup").size() == 0) and (not global.modo_play):
		var color = Color(1,1,1)
		var line = 20
		var p = Vector2(300,300) #cell size
		
		var dinoSelected = get_tree().get_root().get_node("game").dinoSelected
		var dinoFront = get_tree().get_root().get_node("game").dinoFront
		var dinoLeft = get_tree().get_root().get_node("game").dinoLeft
		var dinoRight = get_tree().get_root().get_node("game").dinoRight
		var dinoBack = get_tree().get_root().get_node("game").dinoBack
		
		var tilemap_objects = get_tree().get_nodes_in_group('objects')[0]
		var pos_tile = tilemap_objects.world_to_map(curtgt)	
		if (pos_tile in global.dinos_fixed) or (pos_tile in tilemap_objects.get_used_cells()):
			color = Color(1,0,0)
			draw_line(curtgt+Vector2(0, 0), curtgt+Vector2(p.x, p.y), color, line)
			draw_line(curtgt+Vector2(0, p.y), curtgt+Vector2(p.x, 0), color, line)			
		#drawn cursor cell selector if avaliable
		if grid.has(curtgt):
			
			#circle square
			draw_line(curtgt+Vector2(0, -15), curtgt+Vector2(p.y, -15), color, line)
			draw_line(curtgt+Vector2(0, p.y - 15), curtgt+Vector2(p.x, p.y - 15), color, line)
			draw_line(curtgt+Vector2(0, -15), curtgt+Vector2(0, p.y -15), color, line) #linea vertical
			draw_line(curtgt+Vector2(p.x, -15), curtgt+Vector2(p.x, p.y -15), color, line) #linea vertical
		
		if (not pos_tile in global.dinos_fixed) and (not pos_tile in tilemap_objects.get_used_cells()):
			if dinoSelected == 0 and dinoFront > 0:
				draw_texture(preload("res://assets/texture_dino-front.png"), Vector2(curtgt.x, curtgt.y - 50))
			elif dinoSelected == 1 and dinoLeft > 0:
				draw_texture(preload("res://assets/texture_dino-left.png"), Vector2(curtgt.x, curtgt.y - 50))
			elif dinoSelected == 2 and dinoRight > 0:
				draw_texture(preload("res://assets/texture_dino-right.png"), Vector2(curtgt.x, curtgt.y - 50))
			elif dinoSelected == 3 and dinoBack > 0:
				draw_texture(preload("res://assets/texture_dino-back.png"), Vector2(curtgt.x, curtgt.y - 40))


