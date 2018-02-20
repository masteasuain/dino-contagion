extends Control

func _ready():
	pass

func _on_FXClick_finished():
	self.queue_free()
	pass 


func _on_Continue_pressed():
	get_node("FX-Click").play()
	pass 
