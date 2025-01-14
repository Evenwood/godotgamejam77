# Die.gd
extends Node2D

# References to nodes
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Die properties
var value: int = 1
var is_rolling: bool = false

# Textures for die faces - you'll need to create these
var die_textures = {
	1: preload("res://Assets/die-1.png"),
	2: preload("res://Assets/die-2.png"),
	3: preload("res://Assets/die-3.png"),
	4: preload("res://Assets/die-4.png"),
	5: preload("res://assets/die-5.png"),
	6: preload("res://Assets/die-6.png")
}

func _ready():
	# Initialize die appearance
	roll()

func roll() -> int:
	if is_rolling:
		return value
		
	is_rolling = true
	
	# Generate random value
	value = randi() % 6 + 1
	
	# Play roll animation
	animation_player.play("roll")
	
	# Update the die face after rolling
	update_face()
	
	is_rolling = false
	return value

func update_face():
	# Update sprite texture based on current value
	sprite.texture = die_textures[value]
