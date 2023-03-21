extends TextureRect


@export var drag_data : String


func _get_drag_data(_at_position):
	set_drag_preview(duplicate(0))
	return drag_data
