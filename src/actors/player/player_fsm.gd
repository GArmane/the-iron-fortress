extends StateMachine

onready var player = owner


func _ready() -> void:
	_states = {
		"idle": $Idle,
		"jump": $Jump,
		"walk": $Walk,
		"fall": $Fall,
	}
