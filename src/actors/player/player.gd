class_name Player
extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 10

onready var animation_player: AnimationPlayer = $AnimationPlayer

var motion = Vector2(0, 0) setget set_motion
var velocity = Vector2(0, 0)
var gravity_mult = 1

export var attack_threshold = {
	"attack1": 0.45,
	"attack2": 0.45,
}
export var jump_height = 300
export var speed = 200


# Callbacks
func _ready():
	$Controller.initialize()
	$BodyPivot/LedgeDetectorDown.add_exception(self)
	$BodyPivot/LedgeDetectorUp.add_exception(self)


func _physics_process(_delta):
	velocity.x = motion.x * speed
	velocity.y += GRAVITY * gravity_mult
	velocity = move_and_slide(velocity, UP, true)


# Public API
## Sprite orientation
func change_orientation():
	$BodyPivot.set_scale(Vector2(-$BodyPivot.scale.x, 1))


func get_orientation() -> Vector2:
	return $BodyPivot.scale


## Movement
func can_grab() -> bool:
	return $BodyPivot/LedgeDetectorDown.is_colliding() and not $BodyPivot/LedgeDetectorUp.is_colliding()


func is_falling() -> bool:
	var next_to_ground = test_move(transform, Vector2(0, 10))
	return velocity.y >= 0 and not next_to_ground


func set_motion(value: Vector2) -> void:
	value.x = clamp(value.x, -1, 1)
	value.y = clamp(value.y, -1, 1)
	motion = value
