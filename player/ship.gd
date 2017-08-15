extends Node2D
#|---------------------------------------------
#| Name: ship.gd
#| By: FlyBlind
#| Desc: A script linked to a node. 
#|       Used to control the main character's
#|       ship, and do cool stuff like shoot
#|       and move, and maybe more later
#|---------------------------------------------
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var blast_resource #an empty variable that holds a preloaded blast resource 
var blast_sprite #an empty variable for the blast sprite.
var screen_size #an empty variable for the screen's size
var ship_size #an empty variable to hold the size of the ship
var pew_pew = 0 #for testing the fire button. to be removed later, or reprovisioned
var fire_flip_flop = false # a boolean variable to block spamming fire on hold-down. may not be needed
const SHIP_SPEED_Y = 300 #a constant for how far the ship moves in pixels/sec when used in the process variable
var ship_loc = get_pos() #a variable for where the ship currently is to start.

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	screen_size = get_viewport_rect().size
	ship_size = get_node("ship/sprite").get_texture().get_size()
	ship_loc = get_node("ship").get_pos()
	blast_resource = preload("res://player/energy_blast.tscn") # pre-load the energy-blast resource so it can be used repeatedly
	set_process(true) #set this script to call the _process function every frame draw
	set_process_input(true) #set this script to execute the _input function every time input happens


func _process(delta):
	#NOTE: delta is used to adjust movement calculations to be in pixels/s vs. pixels/frame
	#get the ship's current position, for editing, and writing back in later
	var ship_loc = get_node("ship").get_pos()
	#check if the user pressed up, and check if they aren't already on the top of the screen
	if ((ship_loc.y - ship_size.y*0.5) > 0 and Input.is_action_pressed("player_up")):
		ship_loc.y -= SHIP_SPEED_Y*delta
		get_node("ship").set_pos(ship_loc)
	#same thing except down
	if ((ship_loc.y + ship_size.y*0.5) < screen_size.y and Input.is_action_pressed("player_down")):
		ship_loc.y += SHIP_SPEED_Y*delta
		get_node("ship").set_pos(ship_loc)
	if Input.is_action_pressed("player_right"):
		ship_loc.x += (SHIP_SPEED_Y - 60)*delta
		get_node("ship").set_pos(ship_loc)
	if Input.is_action_pressed("player_left"):
		ship_loc.x -= (SHIP_SPEED_Y + 20)*delta
		get_node("ship").set_pos(ship_loc)
		
	#VV Can be removed later
	get_node("Label").set_text(String(pew_pew))

func _input(event):
	if (event.is_action_pressed("player_fire") and !fire_flip_flop):
		pew_pew+=1 #<< can be removed later
		#make a fresh copy of the blaster sprite
		blast_sprite = blast_resource.instance()
		#call the energy_blast scene's build method to apply the position. make it the nose of the ship.
		blast_sprite.build(Vector2(get_node("ship").get_pos().x + ship_size.x*0.5, get_node("ship").get_pos().y), screen_size.x)
		#fire up the new instance of the blast
		add_child(blast_sprite)
		#flip the boolean to say the space bar is down so fire doesn't spam
		#fire_flip_flop = true
	
	#if (event.is_action_released("player_fire")):
		#reverse the boolean so the player can fire again after releasing.
		#fire_flip_flop = false

func _on_ship_area_enter( area ):
	if area.has_method("destroy"):
		area.destroy()
		destroy()


func destroy():
	#ship go poof/boom
	queue_free()
	#other stuff goes here later if required