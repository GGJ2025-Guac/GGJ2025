extends Node2D

@onready var bubble_manager = $BubbleManager
@onready var cleaner = $Cleaner

@onready var hud = $HUD

# Called when the node enters the scene tree for the first time.
func _ready():
	cleaner.connect("cleaner_shot_bubble", Callable(bubble_manager, "handle_bubble_spawned"))
	cleaner.connect("cleaner_health_change", Callable(hud, "handle_health_change"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
