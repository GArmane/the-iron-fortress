extends State

var _player: Player
	

func _get_input_direction() -> Vector2:
	return Vector2(
		int(Input.is_action_pressed("player_move_right")) - int(Input.is_action_pressed("player_move_left")),
		int(Input.is_action_pressed("player_move_down")) - int(Input.is_action_pressed("player_move_up"))
	)


func _set_motion(input_direction: Vector2) -> Vector2:
	_player.direction = input_direction
	_player.motion.x = input_direction.x
	return input_direction
