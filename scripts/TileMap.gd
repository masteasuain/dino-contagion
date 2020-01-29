extends TileMap

var curtgt = Vector2() #cursor pick
var grid = {}
var draw_node 

func _ready():
	var tiles = get_used_cells()
	for pos in tiles:
		
		#get current cell index
		var idx = get_cell(pos.x,pos.y)

		#else
		var tgt = map_to_world(pos,false) #get world pos
		tgt = Vector2(tgt.x,tgt.y+15) #offset to centralize tile
		
		#grid is dictionary, make data array for each cell
		grid[tgt] = ["empty", null] #[empty/blocked, instance_refernce]
		
	
	draw_node = get_tree().get_nodes_in_group('draw')[0]
	draw_node.grid = grid
	
	set_process(true) #cursor and player interactions
	set_process_input(true) #also cursor and player interactions
	
	pass	


func _process(delta):

	var tgt_cell = world_to_map(get_local_mouse_position())
	
	
	#if tgt_cell is a valid cell (!= -1), sets it to curtgt
	if get_cell(tgt_cell.x, tgt_cell.y) != -1:
		#get world position and centralize offset tile 
		curtgt =  map_to_world(tgt_cell) + Vector2(0,15)
	else:
		curtgt = Vector2() #unable it
	
	#parse cursor target to be drawn
	draw_node.curtgt = curtgt
