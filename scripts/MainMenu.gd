extends TextureRect


func _ready():
    set_process(true)

func _process(delta):
   if Input.is_key_pressed(KEY_ESCAPE):
      get_tree().quit()

func _on_Start_pressed():
	get_node("Musiquita").stop()
	get_node("FX-Start").play()

func _on_FXStart_finished():
	global.dinos_fixed.clear()
	get_tree().change_scene("res://scenes/LevelSelector.tscn")

func _on_Settings_pressed():
	get_node("FX-Click").play()
	var settings = load("res://scenes/PopupSettings.tscn")
	get_node("popups").call_deferred("add_child", settings.instance())

func _on_Close_pressed():
	get_tree().quit()
