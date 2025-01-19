# Author: Darien Roach
# Date Created: 1/13/2025
# Purpose: An overarching script used to store important variables maintaining overall game state and employed by other scripts and scenes.

extends Node

# Statistics variables
var education = 0
var faith = 0
var foreign_relations = 0
var freedom = 0
var health = 0
var influence = 0
var materials = 0
var military_strength = 0
var population = 0
var wealth = 0
var food = 0
var magic = 0
var happiness = 0

# Variables for tracking chaos and order
var chaos = 0
var order = 0

# Global turn tracking
var number_of_turns = 5
var number_of_actions_per_turn = 1
var number_of_dice = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func reset_state() -> void:
	education = 0
	faith = 0
	foreign_relations = 0
	freedom = 0
	health = 0
	influence = 0
	materials = 0
	military_strength = 0
	population = 0
	wealth = 0
	food = 0
	magic = 0
	happiness = 0
	chaos = 0
	order = 0
	
func set_number_of_turns(n):
	if n < 1 || n > 10:
		return
	number_of_turns = n
	
func get_number_of_turns() -> int:
	return number_of_turns
	
func set_number_of_actions_per_turn(n:int) -> void:
	if n < 1 || n > 10:
		return
	number_of_actions_per_turn = n
	
func get_number_of_actions_per_turn() -> int:
	return number_of_actions_per_turn
	
func get_number_of_dice() -> int:
	return number_of_dice
	
func set_number_of_dice(n:int) -> void:
	if n < 1 || n > 10:
		return
	number_of_dice = n
