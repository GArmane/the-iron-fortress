"""
Base interface for all states.
"""
class_name State
extends Node

# warning-ignore:unused_signal
signal finished(next_state_name)


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
