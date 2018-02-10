extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var video_player
var level_1
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	level_1 = preload("res://levels/level1/level_1.tscn")
	video_player=get_node("VideoPlayer")
	set_process(true)
	pass

func _process(delta):
	if !video_player.is_playing():
		var new_l1 = level_1.instance()
		get_tree().get_root().add_child(new_l1)
		get_tree().set_current_scene(new_l1)
		queue_free()
	