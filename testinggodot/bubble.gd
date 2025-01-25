extends Area2D

class_name Bubble

var velocity: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float):
	position += velocity * delta

func set_velocity(new_velocity: Vector2):
	velocity = new_velocity

func _on_pop_timer_timeout() -> void:
	queue_free()
	print("bubble popped")


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("bubble_process"):
		body.bubble_process()
		queue_free()
