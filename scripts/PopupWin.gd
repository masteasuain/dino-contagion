extends Control



func _ready():
	pass


func _on_FXClick_finished():
	get_tree().change_scene("res://scenes/game.tscn")

	#get_tree().change_scene("res://scenes/game.tscn")
	pass 


func _on_Continue_pressed():
	get_node("FX-Click").play()
	pass 
