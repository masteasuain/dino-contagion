extends Panel

# class member variables go here, for example:
const ListItems = preload("res://scenes/editor/ListItems.tscn")
var listIndex =0

func addItem( value ):
	var item = ListItems.instance()
	listIndex += 1
	#item.get_node("number").text = str(listIndex)
	item.get_node("Button").get_node("Label").text = value
	#item.get_node("Label").text = value
	item.rect_min_size = Vector2(300,20)
	$ScrollContainer/list.add_child(item)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	addItem("test")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
