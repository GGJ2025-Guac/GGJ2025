extends CharacterBody2D

class_name Dirt

@onready var player = get_parent().get_node("Cleaner")

@export var speed : float = 100

var strength: float = 0.1

func _physics_process(delta : float):
	var player_position = player.global_position
	var target_position = (player_position - global_position).normalized() * speed
	
	var collision = move_and_collide(target_position * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method("take_damage"):
			print("Dirt collision")
			collider.take_damage(strength)
		
	look_at(player_position)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func bubble_process():
	queue_free()
