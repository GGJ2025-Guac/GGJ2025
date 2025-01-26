extends CanvasLayer

@onready var health_bar = $HFlowContainer/PanelContainer/MarginContainer/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func handle_health_change(health):
	print("HUD handle_health_change health: ", health)
	health_bar.value = health
	
