extends "base_motion.gd"


# Private API
func _init(player: Player):
	_player = player


# Public API
func enter() -> void:
	_player.animation_player.play("fall")


func update(_delta: float) -> void:
	if _player.is_on_floor():
		emit_signal("finished", "idle")
		return
	_process_input()
