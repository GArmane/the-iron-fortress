extends State

var _player: Player
	

func _get_input() -> Vector2:
	return Vector2(
		int(Input.is_action_pressed("player_move_right")) - int(Input.is_action_pressed("player_move_left")),
		int(Input.is_action_pressed("player_move_down")) - int(Input.is_action_pressed("player_move_up"))
	)


func _process_input() -> void:
	var input = _get_input()
	if input.x in [-1, 1] and input.x != _player.get_orientation().x:
		_player.change_orientation()
	_player.motion = input
