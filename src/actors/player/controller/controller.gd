class_name PlayerController
extends StateMachine


onready var player = owner


# Private API
func initialize():
	_states = {
		"attack": preload("res://src/actors/player/controller/states/attack.gd").new(player),
		"dash": preload("res://src/actors/player/controller/states/dash.gd").new(player),
		"fall": preload("res://src/actors/player/controller/states/fall.gd").new(player),
		"idle": preload("res://src/actors/player/controller/states/idle.gd").new(player),
		"ledge_grab": preload("res://src/actors/player/controller/states/ledge_grab.gd").new(player),
		"jump": preload("res://src/actors/player/controller/states/jump.gd").new(player),
		"walk": preload("res://src/actors/player/controller/states/walk.gd").new(player),
	}
	.initialize()
