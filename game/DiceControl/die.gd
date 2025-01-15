# Die.gd
extends Node2D

# References to nodes
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var area: Area2D = $Area2D
@onready var hitbox: CollisionShape2D = $Area2D/CollisionShape2D

# Die properties
var value: int = 1
var is_rolling: bool = false
var dragging = false
var click_offset = Vector2()
var current_drop_zone = null

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
	area.input_pickable = true
	area.connect("input_event", _on_input_event)
	area.connect("area_entered", _on_area_entered)
	area.connect("area_exited", _on_area_exited)
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
	
	# We need to update the hitbox after we change the texture
	var sprite_size = sprite.texture.get_size() * sprite.scale
	var shape = RectangleShape2D.new()
	shape.size = sprite_size
	hitbox.shape = shape 
	hitbox.position = sprite.position
	
func _on_input_event(_viewport, event, _shape_idx):
	# print("Event type: ", event.get_class())
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Start dragging
				dragging = true
				# Store the offset between mouse position and node position
				click_offset = position - get_global_mouse_position()
				change_appearance(dragging)
			else:
				# Stop dragging
				dragging = false
				change_appearance(dragging)
				# Are we over the drop zone?
				if current_drop_zone:
					current_drop_zone.emit_signal("item_dropped", self)

func _process(_delta):
	if dragging:
		position = get_global_mouse_position() + click_offset
		
func change_appearance(is_dragging: bool):
	if is_dragging:
		sprite.modulate = Color(1, 1, 1, 0.7)
		sprite.scale = Vector2(sprite.scale.x + .01, sprite.scale.y + .01)
	else:
		sprite.modulate = Color(1, 1, 1, 1)
		sprite.scale = Vector2(.25, .25)
		
func _on_area_entered(area):
	if area.is_in_group("drop_zone"):
		current_drop_zone = area
		
func _on_area_exited(area):
	if area == current_drop_zone:
		current_drop_zone = null
