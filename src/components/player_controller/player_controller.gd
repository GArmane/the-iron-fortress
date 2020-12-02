class_name PlayerStateMachine
extends StateMachine


onready var player = owner


# Private API
func initialize():
	_states = {
		"attack": preload("res://src/components/player_controller/states/attack.gd").new(player),
		"fall": preload("res://src/components/player_controller/states/fall.gd").new(player),
		"idle": preload("res://src/components/player_controller/states/idle.gd").new(player),
		"ledge_grab": preload("res://src/components/player_controller/states/ledge_grab.gd").new(player),
		"jump": preload("res://src/components/player_controller/states/jump.gd").new(player),
		"walk": preload("res://src/components/player_controller/states/walk.gd").new(player),
	}
	.initialize()
