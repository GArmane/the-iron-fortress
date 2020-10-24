extends "base_motion.gd"


func enter() -> void:
	player.play_animation("jump")
	player.motion.y -= player.jump_height


func exit() -> void:
	player.motion.x = 0


func update(_delta: float) -> void:
	var input_direction = _get_input_direction()
	player.direction = input_direction
	player.motion.x = input_direction.x

	if player.is_on_floor():
		emit_signal("finished", "previous")
