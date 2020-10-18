extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2(0, 0)
var gravity = 10


func _physics_process(_delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		motion.x = 200
	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		motion.x = -200
	else:
		motion.x = 0

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y -= 300

	motion = move_and_slide(motion, UP)
