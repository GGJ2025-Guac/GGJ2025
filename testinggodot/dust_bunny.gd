extends CharacterBody2D

class_name DustBunny

@export var DustParticle: PackedScene

var health: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func bubble_process():
	health -= 34
	if health <= 0:
		queue_free()


func _on_dust_timer_timeout() -> void:
	create_dust()
	
func create_dust():
	print("dust_bunny create_dust")
	if DustParticle:
		var dust_inst = DustParticle.instantiate()
		add_child(dust_inst)
		dust_inst.global_position = global_position
	else:
		print("DustParticle scene not assigned")
