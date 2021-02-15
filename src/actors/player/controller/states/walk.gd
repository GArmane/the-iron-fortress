extends "base_motion.gd"


# Private API
func _init(player: Player):
	_player = player


# Public API
func enter() -> void:
	_process_orientation(_get_input())
	_player.animation_player.play("walk")


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("player_jump"):
		emit_signal("pushdown", "jump")
	elif event.is_action_pressed("player_dash"):
		emit_signal("pushdown", "dash")
	elif event.is_action_pressed("player_attack"):
		emit_signal("pushdown", "attack")
	else:
		return


func update(_delta: float) -> void:
	if _player.is_falling():
		emit_signal("pushdown", "fall")
		return

	if not _process_input():
		emit_signal("popup")
		return
