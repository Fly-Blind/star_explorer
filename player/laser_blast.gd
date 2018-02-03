extends Node2D
#|---------------------------------------------
#| Name: energy_blast.gd
#| By: FlyBlind
#| Desc: A script linked to a node. Built
#|       to make the node instanced infinitely,
#|       and have it auto unload when finished
#|---------------------------------------------
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const BLAST_SPEED = 1500 # constant for speed of the bullet
var end_loc #variable passed in to say where the blast ends


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true) #set the node to perform a task once per frame



func build(start, end):
		get_node("blast").set_pos(start) #set the beginning of the laser blast
		end_loc = end #set the end where the node must unload itself
		

func _process(delta):
	#a dirty one liner function to simply move the bullet forward. No variables are declared to do the work.
	#get_node("blast").set_pos(Vector2(get_node("blast").get_pos().x + BLAST_SPEED*delta, get_node("blast").get_pos().y))
	get_node("blast").translate(Vector2(BLAST_SPEED*delta, 0))
	#^ This is generally a no-no because it's hard to read ^
	
	if (get_node("blast").get_pos().x > end_loc):
		#if the blast gets to the end of the screen
		#as told by the parent node on startup,
		#queue the node attached to this script for unloading
		queue_free() 

func _on_blast_area_enter( area ):
	# "area" is a variable that is a connector to the object who's
	# area has crossed over to this node's area. Can be used
	# to control the other node.
	if area.has_method("destroy"): 
		# check if we have implemented a function called "destroy"
		# on the other node we hit. If we did call it so it can unload itself.
		area.destroy()
		# then call the one we made for this node, too
		destroy()
	#If not, then we haven't properly implemented collision between the two
	#objects yet, or they aren't supposed to do anything to each other.

func destroy():
	# a function for explicity unloading this node.
	# More can be added here later if we want.
	queue_free()