extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("RESET")

#func resume():
	#get_tree().paused = false
	#$AnimationPlayer.play_backwards("blur")
	#
#func paused():
	#get_tree().paused = true
	#$AnimationPlayer.play("blur")
#
#func EscKey():
	#if Input.is_action_just_pressed("escape") and !get_tree().paused:
		#paused()
	#elif Input.is_action_just_pressed("escape") and get_tree().paused:
		#resume()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_resume_pressed() -> void:
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func _on_restart_pressed() -> void:
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	get_tree().reload_current_scene()

#func _process(delta):

	
	#EscKey()
