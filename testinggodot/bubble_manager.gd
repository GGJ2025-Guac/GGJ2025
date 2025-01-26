extends Node2D

class_name BubbleManager

@onready var sfx_player: AudioStreamPlayer = $BubblePopPlayer

var pop_index: int = 0

var sound_effects = {
	0: preload("res://assets/pop1.wav"),
	1: preload("res://assets/pop2.wav"),
	2: preload("res://assets/pop3.wav")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func handle_bubble_spawned(bubble_inst: Bubble, position: Vector2, direction: Vector2):
	add_child(bubble_inst)
	
	bubble_inst.global_position = position
	bubble_inst.set_velocity(direction * 400)

func play_pop_sound():
	sfx_player.stream = sound_effects.get(pop_index, null)
	pop_index = (pop_index + 1) % 3
	if sfx_player.stream:
		sfx_player.play()
	
