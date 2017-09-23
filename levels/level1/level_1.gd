extends Node2D

#|---------------------------------------------
#| Name: Level_1.gd
#| By: FlyBlind
#| Desc: Built to host all the components
#|       of a level. Can be copied and edited
#|       for future levels. Built to run the level
#|       like a "budget Western" Player is stationary
#|       Background is an animation, and enemies
#|       approach the stationary player ship
#|---------------------------------------------

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var obj_timer #a variable to hold a timer object
var textbox_left # a variable to hold a connection to the left textbox face
var textbox_right # same as above, but the right face
var textbox_text # same as above, but for the actual text int he textbox
var textbox_animate # same as above, but for the animator control node in the textbox scene
var isDrawOut = false #Used to determine if the animation is drawing out, and to prevent a drawin/drawout loop
var obj_ship # used to hold a reference to the ship node
var end_scene # used to hold the return scene
var l2_scene
var obj_level_timer
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	end_scene = preload("res://resources/main_menu.tscn")
	l2_scene = preload("res://resources/main_menu.tscn")
	obj_timer = get_node("general_timer")
	obj_ship = get_node("ship")
	textbox_text = get_node("textbox/boxframe/TextInterfaceEngine") #|
	textbox_right = get_node("textbox/boxframe/faceright")          #|
	textbox_left = get_node("textbox/boxframe/faceleft")            #|Take all the nodes we should ever touch, and put their connectors
	textbox_animate = get_node("textbox/AnimationPlayer")           #|in a variable so we don't waste computing power calling it all the time
	textbox_animate.connect("finished", self, "on_anim_finish") # listen to the animation node in the textbox node, and run on_anim_finish below when an animation finishes playing
	textbox_text.connect("buff_end", self, "on_text_finish")
	obj_level_timer = get_node("level_timer")
	obj_timer.connect("timeout", self, "on_timer_timeout")
	obj_ship.connect("exit_tree", self, "player_died")
	obj_timer.set_wait_time(7)
	obj_timer.start()
	obj_level_timer.set_wait_time(get_node("rail/AnimationPlayer").get_current_animation_length())
	obj_level_timer.start()
	pass

func on_timer_timeout():
	draw_in()
	obj_timer.stop()

func text():
	#textbox_text.buff_text("Hi! We're the Dawson Brothers of Dawson Brothers Criminal Law. We've never won a single case, but that's why we're so cheap! Call Now!", 0.02)
	textbox_text.buff_text("H1! ", 0.02)
	textbox_text.buff_silence(1)
	textbox_text.buff_text("We're the Dawson Brothers of Dawson Brothers Criminal Law. ", 0.02)
	textbox_text.buff_silence(0.5)
	textbox_text.buff_text("We've never won a single case,", 0.07)
	textbox_text.buff_text(" but that's why we're so cheap! ", 0.01)
	textbox_text.buff_silence(2.5)
	textbox_text.buff_text("Call now!", 0.02)
	textbox_text.buff_silence(2.5)
	textbox_text.set_state(textbox_text.STATE_OUTPUT)

func draw_in():
	textbox_animate.play("draw_in")

func draw_out():
	textbox_animate.play("draw_out")

func on_anim_finish():
	if !isDrawOut:
		text()
	else: pass

func on_text_finish():
	isDrawOut = true
	textbox_text.reset()
	draw_out()

func player_died():
	var instance = end_scene.instance()
	get_tree().get_root().add_child(instance)
	get_tree().set_current_scene(instance)
	queue_free()

func _on_level_timer_timeout():
	var instance = l2_scene.instance()
	get_tree().get_root().add_child(instance)
	get_tree().set_current_scene(instance)
	queue_free()
	pass # replace with function body
