extends Control

func _ready():
	pass


func _on_FXClick_finished():
	self.queue_free()
	get_tree().get_root().get_node("game").modoEdit()	


func _on_Continue_pressed():
	get_node("FX-Click").play()
