extends TextureRect


signal data_dropped(data)

@export var location : Vector2


func _can_drop_data(_at_position, data):
	return data is String
	
	
func _drop_data(_at_position, data):
	emit_signal("data_dropped", data)
