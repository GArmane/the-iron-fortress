class_name PlayerStateMachine
extends StateMachine


onready var player = owner


# Callbacks
func _ready() -> void:
	_states = {
		"fall": preload("res://src/components/player_state_machine/states/fall.gd").new(player),
		"idle": preload("res://src/components/player_state_machine/states/idle.gd").new(player),
		"jump": preload("res://src/components/player_state_machine/states/jump.gd").new(player),
		"walk": preload("res://src/components/player_state_machine/states/walk.gd").new(player),
	}
