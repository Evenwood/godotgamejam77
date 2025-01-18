extends Control
var paused = false;
@onready var pause_menu = $PanelContainer2/PauseMenu

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if Input.is_action_just_pressed("escape"):
		#pauseMenu()

#func pauseMenu():
	#if paused:
		#pause_menu.hide()
		#Engine.time_scale = 1
	#else: 
		#pause_menu.show()
		#Engine.time_scale = 0
	#paused = !paused
	


func _on_quit_pressed() -> void:
	get_tree().quit()
