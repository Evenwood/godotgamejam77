extends Node

class_name TurnTracker

var number_of_turns = State.get_number_of_turns()
var current_turn = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_number_of_turns()
	reset_current_turn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_number_of_turns() -> void:
	number_of_turns = State.get_number_of_turns()
	
func reset_current_turn() -> void:
	current_turn = 1
	
func get_number_of_turns() -> int:
	return number_of_turns
	
func get_current_turn() -> int:
	return current_turn
	
func next_turn():
	if current_turn == number_of_turns:
		return
	current_turn += 1
