# DiceScene.gd
extends Node2D

# UI Elements
@onready var num_dice_spinner: SpinBox = $DiceUI/MainContainer/ControlsContainer/NumDiceSpinner
@onready var roll_button: Button = $DiceUI/MainContainer/ControlsContainer/RollButton
@onready var results_label: Label = $DiceUI/MainContainer/ResultsLabel
@onready var dice_container: Node2D = $DiceUI/MainContainer/DiceContainer

var die_scene = preload("res://DiceControl/die.tscn")

# Constants
const MIN_DICE = 1
const MAX_DICE = 10
const DICE_SPACING = 100  # Spacing between dice

func _ready():
	# Setup UI elements
	num_dice_spinner.min_value = MIN_DICE
	num_dice_spinner.max_value = MAX_DICE
	num_dice_spinner.value = 1
	
	# Connect signals
	roll_button.pressed.connect(_on_roll_button_pressed)
	
	# Initialize results
	results_label.text = "Roll the dice!"

func _on_roll_button_pressed():
	# Clear previous dice
	for die in dice_container.get_children():
		die.queue_free()
	
	var num_dice = int(num_dice_spinner.value)
	var total = 0
	var results = []
	
	# Calculate starting position for dice layout
	var start_x = -(num_dice * DICE_SPACING) / 2 + DICE_SPACING / 2
	
	# Create and roll each die
	for i in range(num_dice):
		var die_instance = die_scene.instantiate()
		dice_container.add_child(die_instance)
		
		# Position the die
		die_instance.position = Vector2(start_x + (i * DICE_SPACING), 0)
		
		# Roll the die
		var result = die_instance.roll()
		results.append(result)
		total += result
	
	# Update results display
	results_label.text = "Results: " + str(results) + " Total: " + str(total)
