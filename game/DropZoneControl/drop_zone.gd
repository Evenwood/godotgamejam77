extends Area2D

# Signals when an item is dropped
signal item_dropped(item)

# References to nodes
@onready var sprite: ColorRect = $ColorRect
@onready var label: Label = $Label
@onready var info_label: Label = $InfoLabel
@onready var drop_area: CollisionShape2D = $DropArea

var label_text = "this is the text"
var info_text = "this is information"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Enable area detection
	input_pickable = true
	connect("area_entered", _on_area_entered)
	connect("area_exited", _on_area_exited)
	connect("item_dropped", _on_item_dropped)
	sprite.modulate = Color(1, 1, 1, 0.5)
	label.add_theme_color_override("font_color", Color.BLACK)
	var style = StyleBoxFlat.new()
	style.bg_color = Color(1, 1, 1, 0.5)
	label.add_theme_stylebox_override("normal", style)
	label.add_theme_font_size_override("font_size", 12)
	#info_label.show()
	set_label_text(label_text)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_area_entered(area) -> void:
	sprite.modulate = Color(0, 1, 0, 0.5) # Green tint
	show_info()
	
func _on_area_exited(area) -> void:
	sprite.modulate = Color(1, 1, 1, 0.5)
	hide_info()
	
func update_label_position():
	label.position.x = (sprite.position.x + sprite.size.x / 2) - (label.size.x / 2)
	label.position.y = sprite.position.y + sprite.size.y
	
func update_info_position():
	info_label.position.x = (sprite.position.x + sprite.size.x / 2) - (info_label.size.x / 2)
	info_label.position.y = sprite.position.y - info_label.size.y

func set_label_text(new_text):
	label.text = new_text
	label.set_size(Vector2.ZERO)  # Reset size to fit content
	update_label_position()
	
func set_info_text(text):
	info_text = text
	
func show_info():
	print(info_text)
	info_label.text = info_text
	info_label.set_size(Vector2.ZERO)  # Reset size to fit content
	update_info_position()
	info_label.show()
	
func hide_info():
	info_label.hide()
	
func _on_item_dropped(item):
	item.dropped = true
	#print("Drop Zone")
	var dice_scene = get_tree().root.find_child("DiceScene", true, false)
	item.position = dice_scene.to_local(global_position + sprite.size / 2)
	item.z_index = z_index + 1 # Move it in front
	info_label.hide()
	#print("--------")
