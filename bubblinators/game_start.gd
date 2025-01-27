extends CanvasLayer

@onready var start_button: Button = $Start
@onready var end_button: Button = $Quit

@onready var title_label = $Label

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_start"):
		start_button.emit_signal("pressed")
	
	if event.is_action_pressed("ui_back"):
		end_button.emit_signal("pressed")
		
func set_title_text(new_text: String) -> void:
	title_label.text = new_text
