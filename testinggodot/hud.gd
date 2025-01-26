extends CanvasLayer

class_name HUD

@onready var health_bar = $HFlowContainer/PanelContainer/MarginContainer/HealthProgressBar
@onready var clean_bar = $HFlowContainer/PanelContainer4/MarginContainer/CleanedProgressBar

func handle_health_change(health):
	print("HUD handle_health_change health: ", health)
	health_bar.value = health

func handle_clean_change(clean):
	print("HUD handle_clean_change clean: ", clean)
	clean_bar.value = clean
	
