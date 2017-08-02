extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ufo_pos # a variable for where the UFO is currently
const UFO_VEL = -300 # a vartiable for the UFO's velocity
var hover = 0
func _ready():
	#set_pos(Vector2(get_viewport_rect().size.x, get_viewport_rect().size.y*0.5))
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass

func build():
	pass
	
func _on_enemy_ufo_area_enter( area ):
	pass # replace with function body
	
func _process(delta):
	hover += delta*6
	translate(Vector2(UFO_VEL*delta, sin(hover)*6))
