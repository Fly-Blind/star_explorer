extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var start
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	start = preload("res://mov/l1_intro.tscn")


func _on_play_button_pressed():
	 # replace with function body
	var new_start=start.instance()
	get_tree().get_root().add_child(new_start)
	get_tree().set_current_scene(new_start)
	queue_free()
	