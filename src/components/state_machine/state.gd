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


# Function called every physics frame.
func update(_delta: float) -> void:
	pass
