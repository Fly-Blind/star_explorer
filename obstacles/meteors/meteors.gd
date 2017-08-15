extends Node2D

#|---------------------------------------------
#| Name: meteors.gd
#| By: FlyBlind
#| Desc: A script linked to a node. Built
#|       to make a node with a sprite with a
#|       random texture of 5 that moves right to
#|       left and auto unload when finished
#|---------------------------------------------

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const MET_CONST = 250 #a constant for the velocity of a meteor
var met_vel = 0 #a velocity variable for this instance of the meteor after we fiddle with velocity a bit.
var met_loc #a variable for the location of the meteor
var screen_size #a variable for the screen size.

const TEXTURE_ARR = [preload("res://obstacles/meteors/meteor1.png"),
 preload("res://obstacles/meteors/meteor2.png"),
 preload("res://obstacles/meteors/meteor3.png"),
 preload("res://obstacles/meteors/meteor4.png"),
 preload("res://obstacles/meteors/meteor5.png")]# an array constant of all the textures to make the sprite
var met_tex # a variable for the current texture

func _ready():
	var tempcircle = CircleShape2D.new()
	# Called every time the node is added to the scene.
	# Initialization here
	#set_process(true) # Set this script to run on every frame
	screen_size = get_viewport_rect().size
	#VV Everything below is for testing the function by itself.
	#met_loc = Vector2(start_loc.x + get_node("meteor").get_texture().get_size().x*0.5, start_loc.y)
	#met_loc = Vector2(800,50)
	met_loc = get_pos()
	randomize()
	met_tex = TEXTURE_ARR[round(rand_range(0, 4))]
	met_vel += MET_CONST+(round(rand_range(-50, 50)))
	get_node("sprite").set_texture(met_tex)
	if (met_tex.get_size().x > met_tex.get_size().y):
		tempcircle.set_radius(met_tex.get_size().x*2)
	else:
		tempcircle.set_radius(met_tex.get_size().y*2)
	get_node("CollisionShape2D").set_shape(tempcircle)
	

func build(start_loc):
	# set the meteor's location to the location specified by the initating node's script, 
	#then add a little more to x to make the sprite offscreen
	var tempcircle = CircleShape2D.new()
	randomize()
	met_tex = TEXTURE_ARR[round(rand_range(0, 4))]
	#met_loc = Vector2(start_loc.x + get_node("meteor").get_texture().get_size().x*0.5, start_loc.y)
	met_loc = Vector2(start_loc.x + met_tex.get_size().x*0.5, start_loc.y)
	met_vel += MET_CONST+(round(rand_range(-50, 50)))
	set_pos(met_loc)
	get_node("sprite").set_texture(met_tex)
	if (met_tex.get_size().x > met_tex.get_size().y):
		tempcircle.set_radius(met_tex.get_size().x*2)
	else:
		tempcircle.set_radius(met_tex.get_size().y*2)
	get_node("CollisionShape2D").set_shape(tempcircle)
	

func _process(delta):
	#get_node("meteor").set_pos(met_loc)
	met_loc -= Vector2(met_vel*delta, 0)
	set_pos(met_loc)
	#if met_loc.x < -(get_node("sprite").get_texture().get_size().x*0.5):
	#	queue_free()

func destroy():
	queue_free()

func _on_visibility_enter_screen():
	set_process(true)



func _on_visibility_exit_screen():
	queue_free()

