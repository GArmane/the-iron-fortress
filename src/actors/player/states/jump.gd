extends "base_motion.gd"


func enter() -> void:
	player.play_animation("jump")
	player.motion.y -= player.jump_height


func update(_delta: float) -> void:
	if player.is_on_floor():
		emit_signal("finished", "idle")
	elif player.is_falling():
		emit_signal("finished", "fall")
	else:
		var input_direction = _get_input_direction()
		_set_motion(input_direction)
