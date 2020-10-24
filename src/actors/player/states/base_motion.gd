extends State

onready var player: Player = owner


func _get_input_direction() -> Vector2:
	return Vector2(
		int(Input.is_action_pressed("player_move_right")) - int(Input.is_action_pressed("player_move_left")),
		int(Input.is_action_pressed("player_move_down")) - int(Input.is_action_pressed("player_move_up"))
	)
