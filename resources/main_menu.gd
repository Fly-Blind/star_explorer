extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var start
var options
var high_score
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#pass
	start = preload("res://mov/prologue.tscn")
	options = preload("res://resources/options_menu.tscn")
	high_score = preload("res://resources/high_score.tscn")


func _on_play_button_pressed():
	 # replace with function body
	var new_start=start.instance()
	get_tree().get_root().add_child(new_start)
	get_tree().set_current_scene(new_start)
	queue_free()
	

func _on_settings_tex_button_pressed():
	var new_optons=options.instance()
	get_tree().get_root().add_child(new_optons)
	get_tree().set_current_scene(new_optons)
	queue_free()

func _on_hiscore_tex_button_pressed():
	var new_high=high_score.instance()
	get_tree().get_root().add_child(new_high)
	get_tree().set_current_scene(new_high)
	queue_free()
