extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var video_player
var l1_intro
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	l1_intro = preload("res://mov/l1_intro.tscn")
	video_player=get_node("VideoPlayer")
	set_process(true)
	pass

func _process(delta):
	if !video_player.is_playing():
		keynext()
	if Input.is_action_pressed("player_fire"):
		keynext()


func keynext():
	var new_l1 = l1_intro.instance()
	get_tree().get_root().add_child(new_l1)
	get_tree().set_current_scene(new_l1)
	queue_free()
