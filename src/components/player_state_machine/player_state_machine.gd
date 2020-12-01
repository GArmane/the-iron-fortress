class_name PlayerStateMachine
extends StateMachine


onready var player = owner


# Private API
func initialize():
	_states = {
		"attack": preload("res://src/components/player_state_machine/states/attack.gd").new(player),
		"fall": preload("res://src/components/player_state_machine/states/fall.gd").new(player),
		"idle": preload("res://src/components/player_state_machine/states/idle.gd").new(player),
		"jump": preload("res://src/components/player_state_machine/states/jump.gd").new(player),
		"walk": preload("res://src/components/player_state_machine/states/walk.gd").new(player),
	}
	.initialize()
