extends CenterContainer


var game_state = GameState.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	for box in $Grid/GridContainer.get_children():
		box.data_dropped.connect(_on_box_data_dropped.bind(box))


func _on_box_data_dropped(data: String, box: Control):
	var is_legal_move = game_state.is_move_legal(box.location)
	if not is_legal_move:
		return
	game_state.place_letter(data, box.location)
	match data:
		"X":
			box.texture = preload("res://assets/x_sprite.tres")
		"O":
			box.texture = preload("res://assets/o_sprite.tres")
	var winner = game_state.get_winner()
	match winner:
		"X":
			$Grid/Status.text = "PLAYER X WON!"
		"O":
			$Grid/Status.text = "PLAYER O WON!"
