extends Node2D

class_name BubbleManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func handle_bubble_spawned(bubble_inst: Bubble, position: Vector2, direction: Vector2):
	add_child(bubble_inst)
	
	bubble_inst.global_position = position
	bubble_inst.set_velocity(direction * 400)
	
