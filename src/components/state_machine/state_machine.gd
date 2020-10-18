"""
Base interface for all state machines.
"""
class_name StateMachine
extends Node


export(NodePath) var initial_state

onready var _active: bool = false setget set_active, is_active
onready var _state: State = get_node(initial_state)


func _physics_process(delta: float) -> void:
	_state.update(delta)


func initialize() -> void:
	set_active(true)
	_state.enter()


func is_active() -> bool:
	return _active


func set_active(value: bool) -> void:
	_active = value
	set_physics_process(value)
	if not _active:
		_reset()


func _reset() -> void:
	_state = get_node(initial_state)
