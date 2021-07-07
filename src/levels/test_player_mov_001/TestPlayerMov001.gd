extends TileMap

func _ready():
	var overlay = load("res://src/ui/debug_overlay.tscn").instance()
	
	overlay.add_status("FPS", Engine, "get_frames_per_second", true)
	overlay.add_status("Player jump height", $Player, "jump_height", false)
	overlay.add_status("Player base speed", $Player, "speed", false)
	overlay.add_status("Current velocity", $Player, "velocity", false)
	overlay.add_status("Current acceleration", $Player, "acceleration", false)
	overlay.add_status("Gravity force", $Player, "GRAVITY", false)
	overlay.add_status("Friction force", $Player, "FRICTION", false)
	overlay.add_status("Is the player falling?", $Player, "is_falling", true)
	overlay.add_status("Can the player grab?", $Player, "can_grab", true)
	
	add_child(overlay)
