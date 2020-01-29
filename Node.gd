extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	for button in get_tree().get_nodes_in_group("buttons"):
		button.connect("pressed", self, "_on_Button_pressed", [button])	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed(target):
	$ButtonPressed.play()
	print("which button = "+target.name.substr(6,2))
	global.level_selected = int(target.name.substr(6,2))
	get_tree().change_scene("res://scenes/game.tscn")
	pass # Replace with function body.

