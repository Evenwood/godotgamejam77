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
var slotted_die_value = 0
var hover_die_value = 0
var dialog = ConfirmationDialog.new()
var dropped_die = null
var filled = false
var actions = Actions.new()

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
	
func on_area_entered(area, value) -> void:
	if filled:
		return
	set_info_text(Actions.actionText(action_id, value))
	show_info(value)
	if actions.canAfford(action_id, value) == false:
		return
	hover_die_value = value
	sprite.modulate = Color(0, 1, 0, 0.5) # Green tint
	
func _on_area_exited(area) -> void:
	hover_die_value = 0
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
	
func show_info(value):
	#print(info_text)
	if actions.canAfford(action_id, value) == false:
		info_text = "TOO COSTLY!" + "\n" + info_text
	else:
		info_text = "GOOD TO GO" + "\n" + info_text
	info_label.text = info_text
	info_label.set_size(Vector2.ZERO)  # Reset size to fit content
	update_info_position()
	style_info_label(value)
	info_label.show()
	
func style_info_label(value):
	#label.add_theme_color_override("font_color", Color(1, 1, 0, 1))
	var style = info_label.get_theme_stylebox("normal")
	if actions.canAfford(action_id, value) == true:
		style.bg_color = Color(0, 0.8, 0, 1) # Light green
		info_label.add_theme_color_override("font_color", Color(0, 0.3, 0, 1)) # Dark green
	else:
		style.bg_color = Color(0.8, 0, 0, 1)
		info_label.add_theme_color_override("font_color", Color(0.3, 0, 0, 1)) # Light red
	info_label.add_theme_stylebox_override("normal", style)
	
func hide_info():
	info_label.hide()
	
func set_slotted_die_value(value):
	slotted_die_value = value

func get_slotted_die_value():
	return slotted_die_value
	
func set_action_id(id):
	action_id = id
	
func _on_item_dropped(item):
	if filled:
		return
	# Can't drop if cannot afford
	hover_die_value = item.value
	if actions.canAfford(action_id, hover_die_value) == false:
		item.cancel_drop()
		hover_die_value = 0
		return
	item.dropped = true
	dropped_die = item
	info_label.hide()
	dialog.dialog_text = "Die Value: " + str(hover_die_value) + "\n" + \
		info_label.text + \
		"\nAre you sure you want to drop the die here?" 
	dialog.popup_centered()
	#print("--------")

func set_up_label_styles():
	label.add_theme_color_override("font_color", Color.BLACK)
	var style = StyleBoxFlat.new()
	style.bg_color = Color(1, 1, 1, 0.5)
	label.add_theme_stylebox_override("normal", style)
	label.add_theme_font_size_override("font_size", 10)
	
	info_label.add_theme_color_override("font_color", Color.DARK_BLUE)
	var info_style = StyleBoxFlat.new()
	info_style.bg_color = Color(1, 1, 0, 0.8)
	info_label.add_theme_stylebox_override("normal", info_style)
	info_label.add_theme_font_size_override("font_size", 10)
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
	hover_die_value = 0
	slotted_die_value = dropped_die.value
	actions.triggerAction(action_id, slotted_die_value)
	#print(State.influence)
	filled = true
	var turn_tracker_view = get_tree().root.find_child("TurnTrackerView", true, false)
	if turn_tracker_view:
		turn_tracker_view.next_turn()
	

func _on_canceled():
	#print("User canceled")
	hover_die_value = 0
	slotted_die_value = 0
	if dropped_die:
		dropped_die.cancel_drop()
	dropped_die = null
	filled = false
	
	
func cannot_drop():
	return filled || actions.canAfford(action_id, hover_die_value) == false
	
func has_die():
	return filled
	
func clear():
	hover_die_value = 0
	slotted_die_value = 0
	dropped_die = null
	filled = false
