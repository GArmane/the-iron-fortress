"""
Base interface for all states.
"""
class_name State
extends Node


# Initialize state.
func enter():
	return


# Clean up state.
func exit():
	return


func update(delta: float):
	pass
