extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var textbox_left
var textbox_right
var textbox_text
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	textbox_left = get_node("textbox/boxframe/faceleft")
	textbox_right = get_node("textbox/boxframe/faceright")
	textbox_text = get_node("textbox/boxframe/TextInterfaceEngine")
	textbox_text
	text()
	pass

func text():
	textbox_text.buff_text("Hi! We're the Dawson Brothers of Dawson Brothers Criminal Law. We've never won a single case, but that's why we're so cheap! Call Now!", 0.07)
	textbox_text.set_state(textbox_text.STATE_OUTPUT)