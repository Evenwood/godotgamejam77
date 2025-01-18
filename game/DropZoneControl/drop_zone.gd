extends Area2D

# Signals when an item is dropped
signal item_dropped(item)

# References to nodes
@onready var sprite: ColorRect = $ColorRect
@onready var label: Label = $Label
@onready var info_label: Label = $InfoLabel
@onready var drop_area: CollisionShape2D = $DropArea

var Actions = preload("res://ActionControl/actions.gd")

var label_text = "this is the text"
var info_text = "this is information"
var action_id = Datatypes.ACTIONS.Diplomacy
var die_value = 1
var dialog = ConfirmationDialog.new()
var dropped_die = null
var filled = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("drop_zone")
	# Enable area detection
	input_pickable = true
	#connect("area_entered", _on_area_entered)
	connect("area_exited", _on_area_exited)
	connect("item_dropped", _on_item_dropped)
	sprite.modulate = Color(1, 1, 1, 0.5)
	set_up_label_styles()
	set_label_text(label_text)
	info_label.hide()
	set_up_confrm_dialog()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_area_entered(area) -> void:
	if filled:
		return
	sprite.modulate = Color(0, 1, 0, 0.5) # Green tint
	set_info_text(Actions.actionText(action_id, die_value))
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
	#print(info_label.global_position.y)
	if info_label.global_position.y < 0:
		info_label.position.y = sprite.position.y + sprite.size.y

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
	
func set_die_value(value):
	die_value = value

func get_die_value():
	return die_value
	
func set_action_id(id):
	action_id = id
	
func _on_item_dropped(item):
	if filled:
		return
	item.dropped = true
	#print("Drop Zone")
	dropped_die = item
	#dialog.popup_centered()
	info_label.hide()
	dialog.dialog_text = "Die Value: " + str(dropped_die.value) + "\n" + \
		info_label.text + \
		"\nAre you sure you want to drop the die here?" 
	dialog.popup_centered()
	#print("--------")

func set_up_label_styles():
	label.add_theme_color_override("font_color", Color.BLACK)
	var style = StyleBoxFlat.new()
	style.bg_color = Color(1, 1, 1, 0.5)
	label.add_theme_stylebox_override("normal", style)
	label.add_theme_font_size_override("font_size", 12)
	
	info_label.add_theme_color_override("font_color", Color.DARK_BLUE)
	var info_style = StyleBoxFlat.new()
	info_style.bg_color = Color(1, 1, 0, 0.8)
	info_label.add_theme_stylebox_override("normal", info_style)
	info_label.add_theme_font_size_override("font_size", 12)
	info_label.z_index = 10
	
func set_up_confrm_dialog():
	add_child(dialog)
	dialog.title = "Please Confirm"
	dialog.dialog_text = "Are you sure you want to drop the die here?"
	# Connect to the confirmation signal
	dialog.confirmed.connect(_on_confirmed)
	dialog.canceled.connect(_on_canceled)
	
	# Handle the response
func _on_confirmed():
	var dice_scene = get_tree().root.find_child("DiceScene", true, false)
	dropped_die.position = dice_scene.to_local(global_position + sprite.size / 2)
	dropped_die.z_index = z_index + 1 # Move it in front
	filled = true

func _on_canceled():
	#print("User canceled")
	filled = false
	dropped_die.cancel_drop()
	
func has_dropped_die():
	return filled
