extends "base_motion.gd"


# Private API
func _init(player: Player):
	_player = player


# Public API
func enter() -> void:
	_player.play_animation("jump")
	_player.motion.y -= _player.jump_height


func update(_delta: float) -> void:
	if _player.is_on_floor():
		emit_signal("finished", "idle")
	elif _player.is_falling():
		emit_signal("finished", "fall")
	else:
		var input_direction = _get_input_direction()
		_set_motion(input_direction)
