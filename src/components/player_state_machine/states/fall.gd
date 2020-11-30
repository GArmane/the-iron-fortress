extends "base_motion.gd"


# Private API
func _init(player: Player):
	_player = player


# Public API
func enter() -> void:
	_player.motion.x = 0
	_player.play_animation("fall")


func update(_delta: float) -> void:
	var input_direction = _get_input_direction()
	_player.direction = input_direction
	_player.motion.x = input_direction.x

	if _player.is_on_floor():
		emit_signal("finished", "idle")
