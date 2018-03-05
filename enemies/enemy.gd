extends Area2D

#|---------------------------------------------
#| Name: enemy.gd
#| By: FlyBlind
#| Desc: A script linked to a node. Built
#|       for an enemy spaceship that
#|       accellerates partway on screen.
#|---------------------------------------------

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var enemy_value = 300
var enemy_vel = 350 #current running speed of the enemy jet.
var enemy_accel = 10 # used to determine the enemy's speed when they "Stomp it"
var screen_size # Holds the size of the screen, may not be needed soon
var stomp_it # used to determine when on the screen the enemy should "Stomp it" (as the bottom half of a fraction)
var end_posx # used to determine the end of the screen in relation to this object's X location
var start_posx
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#set_process(true)
	screen_size = get_viewport_rect().size
	end_posx = get_pos().x - screen_size.x
	start_posx = get_pos().x
	randomize()
	stomp_it = round(rand_range(2, 6))
	pass

func build(start):
	set_pos(Vector2(start.x, round(rand_range(0,start.y))))
	screen_size = start
	#stomp_it = round(rand_range(2, 4))

func _fixed_process(delta):
	var cur_pos = get_pos()
	if (cur_pos.x <= (start_posx - (screen_size.x/stomp_it))):
		enemy_vel += enemy_accel
	
	#if (cur_pos.x < 0):
	#	queue_free()
	cur_pos.x -= enemy_vel*delta
	set_pos(cur_pos)

func destroy():
	get_node("/root/core").score += enemy_value
	#unloading of the object, and other fancy destroy stuff later.
	queue_free()

func _on_visibility_enter_screen():
#	set_process(true)
	set_fixed_process(true)



func _on_visibility_exit_screen():
	queue_free()

