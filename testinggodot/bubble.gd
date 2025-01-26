extends CharacterBody2D

class_name Bubble

var pos: Vector2
var rot: float
var direction: float
var speed: float = 400

func _ready() -> void:
	global_position = pos
	global_rotation = rot
	
func _physics_process(delta: float) -> void:
	velocity = Vector2(speed, 0).rotated(direction)
	move_and_slide()

func _on_pop_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	node_entered(body)

func _on_area_entered(area: Area2D) -> void:
	node_entered(area)
	
func node_entered(node):
	if node.has_method("bubble_process"):
		node.bubble_process()
		queue_free()
