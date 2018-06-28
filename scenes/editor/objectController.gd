extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	print("ready")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

"""
func _on_object_toggled( button_pressed ):
	if button_pressed:
		dinoSelected = 0
	else:
		dinoSelected = -1
"""
func buttonToggled( button_pressed ):
	print("hola")
	#if button_pressed:
		#get_tree().get_root().get_node("game").dinoSelected = 0
		#dinoSelected = 0
	#else:
		#get_tree().get_root().get_node("game").dinoSelected = -1
		
	#print(get_tree().get_root().get_node("game").dinoSelected)
	#get_node("UI/SFX_click").play()
	#get_node("UI/DinoSelector_2/post_it").pressed = false
	#get_node("UI/DinoSelector_3/post_it").pressed = false
	#get_node("UI/DinoSelector_4/post_it").pressed = false
