extends TextureButton

func _ready():
	set_process(true)
	set_process_input(true)

func _on_play_button_down():
	var player = get_tree().get_nodes_in_group('player')[0]	
	get_node("musiquita").stop()
	get_node("musiquita_play").play()
	global.modo_play = true	
	player.estornudar()


func _on_abort_pressed():
	get_tree().get_root().get_node("game").modoEdit()
