class_name PlayerState
extends State


var _target: Player = null


func initialize(target: Player) -> State:
	_target = target
	return self


func handle_input(event: InputEvent) -> void:
	return
