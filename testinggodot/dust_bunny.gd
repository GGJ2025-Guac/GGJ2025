extends CharacterBody2D

class_name DustBunny

@export var DustParticle: PackedScene

var health: int = 100

var dust_angle: float = 0.0

var strength: float = 10.0
var clean_amount: float = 50.0

var bubble_processed: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(Vector2.ZERO, true)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method("take_damage"):
			print("DustBunny collision")
			collider.take_damage(strength)
			
func bubble_process():
	health -= 34
	if health <= 0:
		print("DustBunny bubble_process")
		if not bubble_processed and get_parent().has_method("clean_change"):
			get_parent().clean_change(clean_amount)
			bubble_processed = true
		queue_free()

func _on_dust_timer_timeout() -> void:
	create_dust(dust_angle)
	dust_angle += 45.0
	
func create_dust(angle_degrees: float = 0.0, speed: float = 200.0):
	if DustParticle:
		var dust_inst = DustParticle.instantiate()
		get_parent().add_child(dust_inst)
		
		var angle_radians = deg_to_rad(angle_degrees)
		
		var offset = Vector2(cos(angle_radians), sin(angle_radians)) * 50
		dust_inst.global_position = global_position + offset

		if dust_inst.has_method("set_velocity"):
			var velocity = Vector2(cos(angle_radians), sin(angle_radians)) * speed
			dust_inst.set_velocity(velocity)
		else:
			print("DustParticle doesn't have a 'set_velocity' method")
	else:
		print("DustParticle scene not assigned")
