extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var enemy_vel = 350
var enemy_accel = 10
var screen_size
var stomp_it
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	screen_size = get_viewport_rect().size
	stomp_it = round(rand_range(2, 4))
	pass

func build(start):
	set_pos(Vector2(start.x, round(rand_range(0,start.y))))
	screen_size = start
	stomp_it = round(rand_range(2, 4))

func _process(delta):
	var cur_pos = get_pos()
	if (get_pos().x <= screen_size.x-(screen_size.x/stomp_it)):
		enemy_vel += enemy_accel
	
	if (get_pos().x < 0):
		queue_free()
	cur_pos.x -= enemy_vel*delta
	set_pos(cur_pos)

func destroy():
	#unloading of the object, and other fancy destroy stuff later.
	queue_free()