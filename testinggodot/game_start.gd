extends CanvasLayer

@onready var start_button: Button = $Start
@onready var end_button: Button = $Quit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_start"):
		start_button.emit_signal("pressed")
	
	if event.is_action_pressed("ui_back"):
		end_button.emit_signal("pressed")
		
		
