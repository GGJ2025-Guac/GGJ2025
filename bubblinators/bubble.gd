extends Area2D

class_name Bubble

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

var velocity: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play()

func _physics_process(delta: float):
	position += velocity * delta

func set_velocity(new_velocity: Vector2):
	velocity = new_velocity

func _on_pop_timer_timeout() -> void:
	pop_bubble()

func _on_body_entered(body: Node2D) -> void:
	node_entered(body)

func _on_area_entered(area: Area2D) -> void:
	node_entered(area)
	
func node_entered(node):
	if node.has_method("bubble_process"):
		node.bubble_process()
		pop_bubble()

func pop_bubble():
	get_parent().play_pop_sound()
	queue_free()
