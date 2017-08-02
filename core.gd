extends Node2D
#|---------------------------------------------
#| Name: core.gd
#| By: FlyBlind
#| Desc: A script linked to a node. Built
#|       to host other nodes and scenes
#|       in a controlable fashion.
#|---------------------------------------------

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var obst_timer #a variable to hold a timer object
var obstacle_resource # a variable to hold one of the obstacle object resources
var obstacle_sprite # a variable to hold an instance of an obstacle.
var screen_size
var enemy_resource # a variable to hold one of the enemy resources
var enemy_sprite # a variable to hold an instance of an enemy
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	obstacle_resource = preload("res://obstacles/meteors/meteor.tscn")
	enemy_resource = preload("res://enemies/enemy.tscn")
	screen_size = get_viewport_rect().size
	add_child(load("res://player/ship.tscn").instance())
	obst_timer = Timer.new()
	obst_timer.connect("timeout", self, "_on_timer_timeout")
	obst_timer.set_one_shot(true)
	obst_timer.set_wait_time(rand_range(0, 1.5))
	obst_timer.start()
	add_child(obst_timer, true)
	pass

func _on_timer_timeout():
	enemy_sprite = enemy_resource.instance()
	enemy_sprite.build(screen_size)
	obstacle_sprite = obstacle_resource.instance()
	obstacle_sprite.build(Vector2(screen_size.x, round(rand_range(0,screen_size.y))))
	add_child(obstacle_sprite)
	add_child(enemy_sprite)
	#obstacle_sprite.build(Vector2(screen_size.x, round(rand_range(0,screen_size.y))))
	randomize()
	obst_timer.set_wait_time(rand_range(0, 1.5))
	obst_timer.start()