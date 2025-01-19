extends CanvasLayer

@onready var event_description: RichTextLabel = $EventUIContainer/EventDescriptionContainer/EventDescription
@onready var event_name: Label = $EventUIContainer/EventName
@onready var event_image: TextureRect = $EventUIContainer/EventDescriptionContainer/MarginContainer/EventImage
@onready var option_1: Button = $EventUIContainer/ChoiceContainer/VBoxContainer/Option1
@onready var option_2: Button = $EventUIContainer/ChoiceContainer/VBoxContainer/Option2
@onready var option_3: Button = $EventUIContainer/ChoiceContainer/VBoxContainer/Option3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	event_description.text = EventProcessing.getEventDescription()
	event_name.text = EventProcessing.getEventName()
	option_1.text = EventProcessing.getEventOptionOne()
	option_2.text = EventProcessing.getEventOptionTwo()
	option_3.text = EventProcessing.getEventOptionThree() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_option_1_pressed() -> void:
	pass # Replace with function body.


func _on_option_2_pressed() -> void:
	pass # Replace with function body.


func _on_option_3_pressed() -> void:
	pass # Replace with function body.
