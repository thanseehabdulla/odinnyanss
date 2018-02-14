extends KinematicBody2D

# This is a demo showing how KinematicBody2D
# move_and_slide works.

# Member variables
const MOTION_SPEED = 160 # Pixels/second
var anim

func _physics_process(delta):
	var motion = Vector2()
	var new_anim = "idle"
	if Input.is_action_pressed("move_up"):
		motion += Vector2(0, -1)
		new_anim = "up"
	if Input.is_action_pressed("move_bottom"):
		motion += Vector2(0, 1)
		new_anim = "down"
	if Input.is_action_pressed("move_left"):
		motion += Vector2(-1, 0)
		new_anim = "back"
	if Input.is_action_pressed("move_right"):
		motion += Vector2(1, 0)
		new_anim = "run"
	
	
	if new_anim != anim:
        anim=new_anim
        get_node("Sprite").play(anim)
	
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)


func _on_TextureButton_pressed():
	var ev = InputEvent()
	ev.type = InputEvent.ACTION
	# set as move_left, pressed
	ev.set_as_action("move_bottom", true)
	Input.parse_input_event(ev)
	pass # replace with function body


func _on_TextureButton2_pressed():
	
	var ev = InputEvent()
	ev.type = InputEvent.ACTION
	# set as move_left, pressed
	ev.set_as_action("move_right", true)
	Input.parse_input_event(ev)
	pass # replace with function body


func _on_TextureButton3_pressed():
	var ev = InputEvent()
	ev.type = InputEvent.ACTION
	# set as move_left, pressed
	ev.set_as_action("move_up", true)
	Input.parse_input_event(ev)
	pass # replace with function body


func _on_TextureButton4_pressed():
	var ev = InputEvent()
	ev.type = InputEvent.ACTION
	# set as move_left, pressed
	ev.set_as_action("move_left", true)
	Input.parse_input_event(ev)
	pass # replace with function body
