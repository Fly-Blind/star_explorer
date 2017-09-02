extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var textbox_left
var textbox_right
var textbox_text
var textbox_animate
var isDrawOut = false #a dirty patch job I am not proud of
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	textbox_left = get_node("textbox/boxframe/faceleft")
	textbox_right = get_node("textbox/boxframe/faceright")
	textbox_text = get_node("textbox/boxframe/TextInterfaceEngine")
	textbox_animate = get_node("textbox/AnimationPlayer")
	textbox_animate.connect("finished", self, "draw_in_anim_finished")
	textbox_text.connect("buff_end", self, "text_finished")
	draw_in()
	#text()
	#draw_out()
	pass

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

func draw_in_anim_finished():
	if !isDrawOut:
		text()
	else: pass

func text_finished():
	isDrawOut = true
	textbox_text.reset()
	draw_out()