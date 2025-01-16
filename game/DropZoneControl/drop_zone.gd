extends Area2D

# Signals when an item is dropped
signal item_dropped(item)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Enable area detection
	input_pickable = true
	connect("area_entered", _on_area_entered)
	connect("area_exited", _on_area_exited)
	
	var sprite = ColorRect.new()  # Or use a Sprite2D
	add_child(sprite)
	sprite.size = Vector2(50, 50)

	modulate = Color(1, 1, 1, 0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_area_entered(area) -> void:
	modulate = Color(0, 1, 0, 0.5) # Green tint
	
func _on_area_exited(area) -> void:
	modulate = Color(1, 1, 1, 0.5)
