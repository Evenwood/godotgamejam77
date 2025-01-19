extends HBoxContainer

var turn_tracker : TurnTracker

var boxes: Array = []
var labels: Array = []

var future_turn_color: Color = Color(0.8, 0.8, 0.8, 1.0)  # Light gray
var current_turn_color: Color = Color(0.0, 0.7, 0.0, 1.0) # Green
var past_turn_color: Color = Color(0.2, 0.2, 0.2, 1.0) # Green
@export var box_size = 40
@export var box_margin = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn_tracker = TurnTracker.new()
	add_child(turn_tracker)
	initialize()
	style_current_turn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func initialize() -> void:
	# Clear existing boxes
	for box in boxes:
		box.queue_free()
	boxes.clear()
	# Create the boxes
	var number_of_turns = turn_tracker.get_number_of_turns()
	for count in range(number_of_turns):
		var style = StyleBoxFlat.new()
		style.set_corner_radius_all(5)
		style.bg_color = future_turn_color
		style.set_border_width_all(2)
		style.border_color = Color(1, 1, 1, 0.5)
		
		var box = Panel.new()
		box.set_custom_minimum_size(Vector2(box_size, box_size))
		box.add_theme_stylebox_override("panel", style)
		
		_add_text_to_box("T" + str(count + 1), box)
		
		add_child(box)
		boxes.append(box)
		
func _add_text_to_box(text, box):
	var label = Label.new()
	label.text = text
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.set_anchors_preset(Control.PRESET_FULL_RECT)
	label.add_theme_color_override("font_color", Color(0.3, 0, 0.4, 1))
	box.add_child(label)
	labels.append(label)
	
func next_turn():
	turn_tracker.next_turn()
	style_previous_turn()
	if turn_tracker.has_another_turn() == false:
		reset()
		var map_interface = get_tree().root.find_child("MapInterface", true, false)
		map_interface.clear_dropzones()
		map_interface.roll_dice()
		var event = map_interface.find_child("EventCanvas", true, false)
		event.show()
	style_current_turn()
	
func style_current_turn():
	var current_turn = turn_tracker.get_current_turn()
	var box = boxes[current_turn-1]
	var label = labels[current_turn-1]
	var style = box.get_theme_stylebox("panel").duplicate()
	style.bg_color = current_turn_color
	box.add_theme_stylebox_override("panel", style)		
	label.add_theme_color_override("font_color", Color(1, 1, 0, 1))

func style_previous_turn():
	var current_turn = turn_tracker.get_current_turn()
	if current_turn == 1:
		return
	var box = boxes[current_turn-2]
	var label = labels[current_turn-2]
	var style = box.get_theme_stylebox("panel").duplicate()
	style.bg_color = past_turn_color
	box.add_theme_stylebox_override("panel", style)		
	label.add_theme_color_override("font_color", Color(0, 0, 0, 1))

func reset() -> void:
	turn_tracker.reset_current_turn()
	for i in range(boxes.size()):
		var box = boxes[i]
		var label = labels[i]
		var style = box.get_theme_stylebox("panel").duplicate()
		style.bg_color = future_turn_color
		box.add_theme_stylebox_override("panel", style)
		# Reset text color
		label.add_theme_color_override("font_color", Color(1, 1, 1, 0.8))  # Default text color
