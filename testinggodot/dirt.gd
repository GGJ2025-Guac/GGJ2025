extends CharacterBody2D

@onready var player = get_parent().get_node("Cleaner")
@export var speed : float = 500

func _physics_process(delta : float):
	var player_position = player.position
	var target_position = (player_position - position).normalized()
	
	move_and_slide()
	look_at(player_position)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func bubble_process():
	queue_free()
