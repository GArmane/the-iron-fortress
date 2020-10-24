extends StateMachine

onready var player = owner


func _ready() -> void:
	_states = {
		"idle": $Idle,
		"jump": $Jump,
		"walk": $Walk,
	}


func on_state_finished(next_state: String) -> void:
	if next_state in ["jump"]:
		_stack.push(_states[next_state])
	.on_state_finished(next_state)
