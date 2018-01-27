extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var video_player
var next_scene
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	next_scene = preload("res://levels/level4/level_4.tscn")
	video_player=get_node("VideoPlayer")
	set_process(true)
	pass

func _process(delta):
	if !video_player.is_playing():
		var new_scene = next_scene.instance()
		get_tree().get_root().add_child(new_scene)
		get_tree().set_current_scene(new_scene)
		queue_free()
	