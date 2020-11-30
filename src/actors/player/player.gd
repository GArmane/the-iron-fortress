class_name Player
extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 10

var direction = Vector2(1, 1) setget set_direction
var motion = Vector2(0, 0)

export var jump_height = 300
export var speed = 200


# Callbacks
func _ready():
	$StateMachine.initialize()


func _physics_process(_delta):
	motion.x *= speed
	motion.y += GRAVITY
	motion = move_and_slide(motion, UP, true)


# Public API
func current_animation() -> String:
	return $AnimationPlayer.current_animation


func is_falling() -> bool:
	var next_to_ground = test_move(transform, Vector2(0, 10))
	return motion.y >= 0 and not next_to_ground


func play_animation(name: String) -> void:
	$AnimationPlayer.play(name)


func set_direction(value: Vector2) -> void:
	if not value.x in [-1, 1]:
		return
	direction = value
	$BodyPivot.set_scale(Vector2(direction.x, 1))
