extends Area2D

class_name DustParticle

var velocity: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float):
	position += velocity * delta

func bubble_process():
	queue_free()

func _on_body_entered(body: Node2D):
	# don't disappear if touching a DustBunny
	if not body.has_method("create_dust"):
		queue_free()

func set_velocity(new_velocity: Vector2):
	velocity = new_velocity


func _on_dust_timer_timeout() -> void:
	queue_free()
