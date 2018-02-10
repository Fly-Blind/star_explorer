extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var main
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	main = preload("res://resources/main_menu.tscn")
	pass


func _on_back_tex_button_pressed():
	var new_main=main.instance()
	get_tree().get_root().add_child(new_main)
	get_tree().set_current_scene(new_main)
	queue_free()
