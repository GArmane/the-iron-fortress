extends CanvasLayer

var statuses = []

func _ready():
	pass

func _process(delta):
	var label_text = ""
	
	for status in statuses:
		var text_value = null
		var status_name = status[0]
		var object = status[1]
		var reference = status[2]
		var is_method = status[3]
		
		if object:
			if is_method:
				text_value = object.call(reference)
			else:
				text_value = object.get(reference)
				
		label_text += str(status_name, ": ", text_value, "\n")
	
	$Label.text = label_text

func add_status(status_name, object, reference, is_method):
	statuses.append([status_name, object, reference, is_method])
