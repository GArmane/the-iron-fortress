extends "base_motion.gd"


# Private API
func _init(player: Player):
	_player = player


# Public API
func enter() -> void:
	_player.velocity.y = -_player.jump_height
	_player.animation_player.play("jump")


func update(_delta: float) -> void:
	if _player.is_on_floor():
		emit_signal("finished", "idle")
	elif _player.is_falling():
		emit_signal("finished", "fall")
	else:
		_process_input()
