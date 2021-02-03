extends State


var _player: Player


func _init(player: Player):
	_player = player


func enter() -> void:
	_player.motion = Vector2(0, 0)
	_player.velocity = Vector2(0, 0)
	_player.gravity_mult = 0

	_player.animation_player.play("ledge_grab")


func exit() -> void:
	_player.gravity_mult = 1


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("player_jump"):
		emit_signal("change", "jump")
