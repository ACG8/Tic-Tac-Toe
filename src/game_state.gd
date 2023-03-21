class_name GameState
extends Resource


var grid : Array[Array] = [
	["","",""],
	["","",""],
	["","",""]
]


## returns X if the X player won or O if the O player won
func get_winner() -> String:
	var triples = _get_rows() + _get_columns() + _get_diagonals()
	for triple in triples:
		var common_string = _get_common_string(triple as Array)
		if common_string != "":
			return common_string
	return ""
	
	
func place_letter(letter: String, position: Vector2) -> void:
	grid[position.y][position.x] = letter
	
	
func is_move_legal(position: Vector2) -> bool:
	var letter_at_position = grid[position.y][position.x]
	return letter_at_position == ""


func _get_common_string(array: Array) -> String:
	var first_string = array[0]
	if array[1] == first_string and array[2] == first_string:
		return first_string
	return ""


func _get_rows() -> Array:
	return grid
	

func _get_columns() -> Array:
	var output : Array[Array] = []
	for idx in range(3):
		var column = [grid[0][idx], grid[1][idx], grid[2][idx]]
		output.append(column)
	return output


func _get_diagonals() -> Array:
	return [
		[grid[0][0], grid[1][1], grid[2][2]],
		[grid[0][2], grid[1][1], grid[2][0]],
	]
