extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# on Quit button press
func _on_button_2_pressed() -> void:
	get_tree().quit()

# on Start Game button press
func _on_button_pressed() -> void:
	#var gameScene = preload("res://GUI/Map_interface.tscn")
	#$AudioStreamPlayer2D.play()
	get_tree().change_scene_to_file("res://GUI/Map_interface.tscn")
	

func _on_close_story_pressed() -> void:
	$TextureRect/ColorRect2/RichTextLabel/AudioStreamPlayer2D.volume_db = -100
	$TextureRect/ColorRect2.visible = false
