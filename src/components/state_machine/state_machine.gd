"""
Base interface for all state machines.
"""
class_name StateMachine
extends Node

signal state_changed(state)

export(NodePath) var initial_state

onready var _active: bool = false setget set_active, is_active
onready var _stack: Stack = Stack.new()
onready var _states: Dictionary = {}


# Callbacks
func _input(event: InputEvent) -> void:
	_stack.peek().handle_input(event)


func _physics_process(delta: float) -> void:
	_stack.peek().update(delta)


func _ready():
	for child in get_children():
		child.connect("finished", self, "on_state_finished")
	initialize()


# Private API
func _enter_state(state: State):
	state.enter()
	_stack.push(state)


# Public API
func get_current_state():
	return _stack.peek()


func initialize() -> void:
	set_active(true)

	var state = get_node(initial_state)
	_stack.push(state)
	state.enter()


func reset() -> void:
	shutdown()
	initialize()


func shutdown() -> void:
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
func on_state_finished(next: String) -> void:
	pop_state()
	
	if next == "previous":
		get_current_state().enter()
	else:
		push_state(next)
