extends Area2D

#|---------------------------------------------
#| Name: enemy_speeder.gd
#| By: FlyBlind
#| Desc: A script linked to a node. Built
#|       to make a speeder sprite move across
#|       the screen.
#|---------------------------------------------

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var enemy_value = 400
var speeder_vel = 400 # a variable for the speeder ship to start.
var speeder_accel = 30 #a variable 
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _fixed_process(delta):
	pass

func destroy():
	get_node("/root/core").score += enemy_value
	#holds unload function, but can call other functions if needed later.
	queue_free()

func _on_visibility_enter_screen():
	set_fixed_process(true)



func _on_visibility_exit_screen():
	queue_free()

