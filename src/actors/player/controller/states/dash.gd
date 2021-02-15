extends "base_motion.gd"


var _dash_timer = Timer.new()


# Private API
func _init(player: Player):
	_player = player
	_player.add_child(_setup_timer())

func _get_dash_direction() -> Vector2:
	var input = _get_input()
	match input:
		Vector2.ZERO:
			var orientation = _player.get_orientation()
			return Vector2(-orientation.x, 0)
		_:
			return Vector2(input.x, 0)

func _setup_timer() -> Timer:
	_dash_timer.name = "dash_timer"
	_dash_timer.set_wait_time(_player.dash_time)
	_dash_timer.set_one_shot(true)
	_dash_timer.connect("timeout", self, "on_timer_timeout")
	return _dash_timer

# Public API
func enter() -> void:
	_player.animation_player.play("dash")
	_player.speed *= _player.dash_speed_mul
	_player.motion.x = _get_dash_direction().x
	_dash_timer.start()

func exit() -> void:
	_player.speed /= _player.dash_speed_mul


func on_timer_timeout() -> void:
	emit_signal("popup")
