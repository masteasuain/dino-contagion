extends Control



func _ready():
	pass


func _on_FXClick_finished():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	pass 


func _on_Continue_pressed():
	get_node("FX-Click").play()
	pass 
