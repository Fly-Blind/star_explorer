extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speeder_vel = 400 # a variable for the speeder ship to start.
var speeder_accel = 30 #a variable 
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	pass

func destroy():
	#holds unload function, but can call other functions if needed later.
	queue_free()

func _on_visibility_enter_screen():
	set_process(true)
	pass # replace with function body


func _on_visibility_exit_screen():
	queue_free()
	pass # replace with function body
