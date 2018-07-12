extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var gameController = get_tree().get_root().get_node("game")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Button_pressed():
	gameController.dinoSelected = 0
	#get_node("UI/SFX_click").play()
	#get_node("UI/DinoSelector_2/post_it").pressed = false
	#get_node("UI/DinoSelector_3/post_it").pressed = false
	#get_node("UI/DinoSelector_4/post_it").pressed = false
	print("selected DinoFront")
	pass
