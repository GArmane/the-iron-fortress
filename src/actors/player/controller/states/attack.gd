extends State

var _player: Player


# Private API
func _init(player: Player):
	_player = player
	_player.animation_player.connect("animation_finished", self, "on_animation_finished")


# Public API
func enter() -> void:
	_player.motion = Vector2(0, 0)
	# warning-ignore:return_value_discarded
	_player.animation_player.play("attack1")


func handle_input(event: InputEvent) -> void:
	var ap: AnimationPlayer = _player.animation_player
	if event.is_action_pressed("player_attack"):
		match ap.current_animation:
			"attack1":
				if ap.current_animation_position >= _player.attack_threshold["attack1"]:
					_player.animation_player.play("attack2")
			"attack2":
				if ap.current_animation_position >= _player.attack_threshold["attack2"]:
					_player.animation_player.play("attack3")
			_:
				return

func on_animation_finished(name) -> void:
	match name:
		"attack1", "attack2", "attack3":
			emit_signal("popup")
		_:
			return
