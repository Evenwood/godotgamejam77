# DiceScene.gd
extends Node2D

# UI Elements
@onready var num_dice_spinner: SpinBox = $DiceUI/MainContainer/ControlsContainer/NumDiceSpinner
@onready var roll_button: Button = $DiceUI/MainContainer/ControlsContainer/RollButton
@onready var results_label: Label = $DiceUI/MainContainer/ResultsLabel
@onready var dice_container: Node2D = $DiceContainer

var die_scene = preload("res://DiceControl/die.tscn")

# Constants
const MIN_DICE = 1
const MAX_DICE = 10
const DICE_SPACING = 50  # Spacing between dice

var num_dice = State.get_number_of_dice()

func _ready():
	add_to_group("dice_scene")
	# Setup UI elements
	num_dice_spinner.min_value = MIN_DICE
	num_dice_spinner.max_value = MAX_DICE
	num_dice_spinner.value = 1
	
	# Connect signals
	roll_button.pressed.connect(_on_roll_button_pressed)
	
	# Initialize results
	results_label.text = "Roll the dice!"
	$DiceUI.hide()

func _on_roll_button_pressed():
	num_dice = int(num_dice_spinner.value)
	roll_dice()

func roll_dice():
	# Clear previous dice
	for die in dice_container.get_children():
		die.queue_free()
	
	var total = 0
	var results = []
	
	# Calculate starting position for dice layout
	var start_x = -(num_dice * DICE_SPACING) / 2 + DICE_SPACING / 2
	
	# Create and roll each die
	for i in range(num_dice):
		var die_instance = die_scene.instantiate()
		die_instance.name = "die" + str(i)
		dice_container.add_child(die_instance)
		
		# Position the die
		die_instance.position = Vector2(start_x + (i * DICE_SPACING), 0)
		
		# Roll the die
		var result = die_instance.roll()
		results.append(result)
		total += result
	
	# Update results display
	results_label.text = "Results: " + str(results) + " Total: " + str(total)
	
	var mapinterface = get_tree().root.find_child("MapInterface", true, false)
	if mapinterface:
		mapinterface.clear_dropzones()		
