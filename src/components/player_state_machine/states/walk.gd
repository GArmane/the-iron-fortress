extends "base_motion.gd"


# Private API
func _init(player: Player):
	_player = player


# Public API
func enter() -> void:
	_player.play_animation("walk")


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("player_jump"):
		emit_signal("finished", "jump")


func update(_delta: float) -> void:
	if _player.is_falling():
		emit_signal("finished", "fall")
		return

	var input_direction = _get_input_direction()
	if not input_direction:
		emit_signal("finished", "idle")
		return

	_set_motion(input_direction)
