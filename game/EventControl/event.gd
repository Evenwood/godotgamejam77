extends Control
@onready var event_description: RichTextLabel = $EventCanvas/EventUIContainer/EventDescriptionContainer/EventDescription
@onready var event_name: Label = $EventCanvas/EventUIContainer/EventName
@onready var event_image: TextureRect = $EventCanvas/EventUIContainer/EventDescriptionContainer/MarginContainer/EventImage
@onready var option_1: Button = $EventCanvas/EventUIContainer/ChoiceContainer/VBoxContainer/Option1
@onready var option_2: Button = $EventCanvas/EventUIContainer/ChoiceContainer/VBoxContainer/Option2
@onready var option_3: Button = $EventCanvas/EventUIContainer/ChoiceContainer/VBoxContainer/Option3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_option_1_pressed() -> void:
	pass # Replace with function body.


func _on_option_2_pressed() -> void:
	pass # Replace with function body.


func _on_option_3_pressed() -> void:
	pass # Replace with function body.
