extends CharacterBody2D

class_name DustBunny

var health: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func bubble_process():
	health -= 34
	if health <= 0:
		queue_free()
