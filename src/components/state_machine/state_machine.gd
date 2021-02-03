"""
Base interface for all state machines.
"""
class_name StateMachine
extends Node

signal state_changed(state)

export(String) var initial_state

onready var _active: bool = false setget set_active, is_active
onready var _stack: Stack = Stack.new()
onready var _states: Dictionary = {}
onready var _signal_map: Dictionary = {
	"pushdown": "on_state_pushdown",
	"popup": "on_state_popup",
	"change": "on_state_change",
}


# Callbacks
func _ready():
	assert(initial_state, "must set state machine initial state")


func _input(event: InputEvent) -> void:
	_stack.peek().handle_input(event)


func _physics_process(delta: float) -> void:
	_stack.peek().update(delta)


# Public API
func get_current_state():
	return _stack.peek()


func initialize() -> void:
	for signal_ in _signal_map:
		for name in _states.keys():
			var state = _states[name]
			state.name = name
			state.connect(signal_, self, _signal_map[signal_])

	set_active(true)
	push_state(initial_state)


func reset() -> void:
	shutdown()
	initialize()


func shutdown() -> void:
	for signal_ in _signal_map:
		for state in _states.values():
			state.disconnect(signal_, self, _signal_map[signal_])
	set_active(false)


func is_active() -> bool:
	return _active


func pop_state() -> void:
	var current_state = _stack.pop()
	current_state.exit()


func push_state(state: String) -> void:
	var new_state = _states[state]
	new_state.enter()
	_stack.push(new_state)


func set_active(value: bool) -> void:
	_active = value
	set_physics_process(value)
	set_process_input(value)


# Signal handlers
func on_state_pushdown(next: String) -> void:
	push_state(next)
	emit_signal("state_changed", get_current_state())


func on_state_popup() -> void:
	pop_state()
	var current_state = get_current_state()
	current_state.enter()
	emit_signal("state_changed", current_state)


func on_state_change(next: String) -> void:
	pop_state()
	push_state(next)
	emit_signal("state_changed", get_current_state())
