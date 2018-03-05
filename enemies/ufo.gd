extends Area2D

#|---------------------------------------------
#| Name: ufo.gd
#| By: FlyBlind
#| Desc: A script linked to a node. Built
#|       to make a UFO sprite move across
#|       the screen while waving up and down
#|       
#|---------------------------------------------

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var enemy_value = 250
var ufo_pos # a variable for where the UFO is currently
const UFO_VEL = -300 # a vartiable for the UFO's velocity
var hover = 0 # used as part of a Sine function to make the UFO wave up and down
#Basically, it's the sine's X value
func _ready():
	#set_pos(Vector2(get_viewport_rect().size.x, get_viewport_rect().size.y*0.5))
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func build():
	pass
	
func _on_enemy_ufo_area_enter( area ):
	
	pass # replace with function body
	
func _process(delta):
	hover += delta*6 #progress the sine function's variable somewhat
	translate(Vector2(UFO_VEL*delta, sin(hover)*6)) #update the ship's position


func _on_visibility_enter_screen():
	set_process(true) #start moving the ship now that the ship can be seen


func _on_visibility_exit_screen():
	queue_free() #unload the ship to save memory
