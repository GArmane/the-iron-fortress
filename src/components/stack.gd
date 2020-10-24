class_name Stack
extends Node


const _stack = []


func clear():
	_stack.clear()


func peek():
	var item = pop()
	if item:
		push(item)
	return item


func pop():
	return _stack.pop_front()


func push(item):
	_stack.push_front(item)
