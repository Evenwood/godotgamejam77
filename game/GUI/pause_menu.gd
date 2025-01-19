extends Control
var paused = false;


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


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_resume_pressed() -> void:
	hide()


func _on_credits_pressed() -> void:
	#res://Assets/Credits.jpg
	get_tree().change_scene_to_file("res://GUI/credits.tscn")
	#pass
