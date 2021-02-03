"""
Base interface for all states.
"""
class_name State
extends Node

# Signals SM to push a new state at the top of the stack and execute
# warning-ignore:unused_signal
signal pushdown(next_state_name)

# Signals SM to pop current state and go back to previous state and execute
# warning-ignore:unused_signal
signal popup()

# Signals SM to pop current state and pushdown new state and execute
# warning-ignore:unused_signal
signal change()


# Initialize state.
func enter() -> void:
	return


# Clean up state.
func exit() -> void:
	return


# Function called every physics frame by the state machine.
func update(_delta: float) -> void:
	return


# Function called every time an input arrives at the state machine.
func handle_input(_event: InputEvent) -> void:
	return
