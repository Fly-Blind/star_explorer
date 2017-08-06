extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var shuffle = 120 # a variable for shuffling the level

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	translate(Vector2(-shuffle*delta,0))