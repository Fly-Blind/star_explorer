extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var next_scene
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	next_scene = preload("res://resources/inter_level_menu.tscn")
	pass


func _on_Button_pressed():
	var instance = next_scene.instance()
	instance.get_node(".").level = 8
	get_tree().get_root().add_child(instance)
	get_tree().set_current_scene(instance)
	queue_free()
	pass # replace with function body