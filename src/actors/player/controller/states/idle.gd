extends "base_motion.gd"


# Private API
func _init(player: Player):
	_player = player


# Public API
func enter() -> void:
	_player.animation_player.play("idle")


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("player_jump"):
		emit_signal("finished", "jump")
	elif event.is_action_pressed("player_attack"):
		emit_signal("finished", "attack")


func update(_delta: float) -> void:
	if _player.is_falling():
		emit_signal("finished", "fall")
		return

	if _get_input().x:
		emit_signal("finished", "walk")
