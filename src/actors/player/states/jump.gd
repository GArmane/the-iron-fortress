extends "base_motion.gd"


func enter() -> void:
	player.play_animation("jump")
	player.motion.y -= player.jump_height


func update(_delta: float) -> void:
	if _is_falling():
		emit_signal("finished", "fall")
		return

	var input_direction = _get_input_direction()
	_set_motion(input_direction)
