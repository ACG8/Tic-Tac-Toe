# GdUnit generated TestSuite
class_name GameStateTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://game_state.gd'


func test_placing_a_letter_in_an_empty_space_should_be_legal() -> void:
	var game_state = GameState.new()
	assert_bool(game_state.is_move_legal(Vector2.ZERO)).is_true()


func test_placing_a_letter_over_another_letter_should_not_be_legal() -> void:
	var game_state = GameState.new()
	game_state.place_letter("O", Vector2.ZERO)
	assert_bool(game_state.is_move_legal(Vector2.ZERO)).is_false()


func test_is_winner_should_return_empty_string_for_new_board() -> void:
	var game_state = GameState.new()
	assert_str(game_state.get_winner()).is_empty()


func test_is_winner_should_return_player_with_three_in_a_row() -> void:
	var game_state = GameState.new()
	game_state.place_letter("O", Vector2(0,0))
	game_state.place_letter("O", Vector2(1,0))
	game_state.place_letter("O", Vector2(2,0))
	assert_str(game_state.get_winner()).is_equal("O")


func test_is_winner_should_return_player_with_three_in_a_column() -> void:
	var game_state = GameState.new()
	game_state.place_letter("O", Vector2(0,0))
	game_state.place_letter("O", Vector2(0,1))
	game_state.place_letter("O", Vector2(0,2))
	assert_str(game_state.get_winner()).is_equal("O")
	

func test_is_winner_should_return_player_with_three_in_a_diagonal() -> void:
	var game_state = GameState.new()
	game_state.place_letter("O", Vector2(0,0))
	game_state.place_letter("O", Vector2(1,1))
	game_state.place_letter("O", Vector2(2,2))
	assert_str(game_state.get_winner()).is_equal("O")
