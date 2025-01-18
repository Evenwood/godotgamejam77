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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
