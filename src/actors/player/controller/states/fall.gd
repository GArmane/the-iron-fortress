extends "base_motion.gd"


# Private API
func _init(player: Player):
	_player = player


# Public API
func enter() -> void:
	_player.animation_player.play("fall")


func update(_delta: float) -> void:
	if _player.can_grab():
		emit_signal("change", "ledge_grab")
	elif _player.is_on_floor():
		emit_signal("popup")
	else:
		_process_input()
