extends CanvasLayer

@onready var event_description: RichTextLabel = $EventUIContainer/EventDescriptionContainer/EventDescription
@onready var event_name: Label = $EventUIContainer/EventName
@onready var event_image: TextureRect = $EventUIContainer/EventDescriptionContainer/MarginContainer/EventImage
@onready var option_1: Button = $EventUIContainer/ChoiceContainer/VBoxContainer/Option1
@onready var option_2: Button = $EventUIContainer/ChoiceContainer/VBoxContainer/Option2
@onready var option_3: Button = $EventUIContainer/ChoiceContainer/VBoxContainer/Option3
@onready var event_results: ConfirmationDialog = $EventResults

var choice


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setEventDetails()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setEventDetails() -> void:
	event_description.text = EventProcessing.getEventDescription()
	event_name.text = EventProcessing.getEventName()
	option_1.text = EventProcessing.getEventOptionOne()
	option_2.text = EventProcessing.getEventOptionTwo()
	option_3.text = EventProcessing.getEventOptionThree()
	

	
func _on_option_1_pressed() -> void:
	choice = 1
	event_results.dialog_text = EventProcessing.getEventResults(choice)
	event_results.show()


func _on_option_2_pressed() -> void:
	choice = 2
	event_results.dialog_text = EventProcessing.getEventResults(choice)
	event_results.show()


func _on_option_3_pressed() -> void:
	choice = 3
	event_results.dialog_text = EventProcessing.getEventResults(choice)
	event_results.show()


func _on_visibility_changed() -> void:
	setEventDetails()


func _on_event_results_confirmed() -> void:
	EventProcessing.triggerEvent(choice)


func _on_event_results_canceled() -> void:
	choice = 0
