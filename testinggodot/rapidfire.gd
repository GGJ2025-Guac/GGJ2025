extends Area2D

func _on_body_entered(body: Cleaner) -> void:
	print("Collision")
	body.enable_rapid_fire()
	queue_free()
