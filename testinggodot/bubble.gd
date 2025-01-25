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
	
	if not is_on_screen():
		print("bubble remove")
		queue_free()

func set_velocity(new_velocity: Vector2):
	velocity = new_velocity

func get_bubble_size() -> Vector2:
	var sprite: Sprite2D = $Sprite2D
	if sprite and sprite.texture:
		return sprite.texture.get_size() * sprite.scale
	return Vector2.ZERO
		
func is_on_screen():
	var viewport = get_viewport().get_visible_rect()
	var bubble_size = get_bubble_size()
	viewport.size += bubble_size
	viewport.position -= bubble_size / 2
	return viewport.has_point(global_position)
