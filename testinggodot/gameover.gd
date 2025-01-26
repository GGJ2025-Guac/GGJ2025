extends CanvasLayer

@onready var start_button: Button = $Retry
@onready var end_button: Button = $Quit

func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_start"):
		start_button.emit_signal("pressed")
	
	if event.is_action_pressed("ui_back"):
		end_button.emit_signal("pressed")
