extends Area2D

class_name DustParticle

var velocity: Vector2 = Vector2.ZERO

var strength: float = 1.0
	
func _physics_process(delta: float):
	position += velocity * delta

func bubble_process():
	queue_free()

func _on_body_entered(body: Node2D):
	# don't disappear if touching a DustBunny
	if not body.has_method("create_dust"):
		if body.has_method("take_damage"):
			print("DustParticle collision")
			body.take_damage(strength)
		queue_free()

func set_velocity(new_velocity: Vector2):
	velocity = new_velocity


func _on_dust_timer_timeout() -> void:
	queue_free()
