extends "base_motion.gd"


# Public API
func enter() -> void:
	player.play_animation("walk")


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("player_jump"):
		emit_signal("finished", "jump")


func update(_delta: float) -> void:
	var input_direction = _get_input_direction()
	if not input_direction:
		emit_signal("finished", "idle")
	player.direction = input_direction
	player.motion.x = input_direction.x
