extends Node2D

@onready var bubble_manager = $BubbleManager
@onready var cleaner = $Cleaner

# Called when the node enters the scene tree for the first time.
func _ready():
	cleaner.connect("cleaner_shot_bubble", Callable(bubble_manager, "handle_bubble_spawned"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
