extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var main_menu # A variable containing the main menu scene.
var level = 0 # a variable containing the current stage (who called it) as an int. int is 1 based. 0 will force to main menu
#0 means testing, or not properly addressed
var level_scene # a variable containing the next appropriate scene.
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	main_menu = preload("res://resources/main_menu.tscn")
	get_node("TextureFrame/RichTextLabel").set_text(str(level))
	#**This will contain a condition check for which stage called this menu
	#**And the appropriate next stage will be pre-loaded
	if level == 0:
		level_scene = main_menu
	if level == 1:
		level_scene = preload("res://levels/level2/level_2.tscn")
	if level == 2:
		level_scene = preload("res://levels/level3/level_3.tscn")
	if level == 3:
		level_scene = preload("res://levels/level4/level_4.tscn")
	if level == 4:
		level_scene = preload("res://levels/level5/level_5.tscn")
	if level == 5:
		level_scene = preload("res://levels/level6/level_6.tscn")
	if level == 6:
		level_scene = preload("res://levels/level7/level_7.tscn")
	if level == 7:
		level_scene = preload("res://levels/level8/level_8.tscn")
	if level == 8:
		level_scene = preload("res://levels/level9/level_9.tscn")
	if level == 9:
		level_scene = preload("res://levels/level10/level_10.tscn")
	if level == 10:
		level_scene = main_menu
		#HOW DID I GET HERE?!
	pass


func _on_TextureButton_pressed():
	var new_instance=level_scene.instance()
	get_tree().get_root().add_child(new_instance)
	get_tree().set_current_scene(new_instance)
	queue_free()
	pass # replace with function body
