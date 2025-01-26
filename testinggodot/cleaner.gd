extends CharacterBody2D

class_name Cleaner

@export var Bubble: PackedScene

@onready var gun_tip: Marker2D = $GunTip

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

@onready var sfx_player: AudioStreamPlayer = $GunPlayer

signal cleaner_shot_bubble(bubble_inst, position, direction)

signal cleaner_health_change(health)

var speed: float = 500.0

var health: float = 100.0

var is_dead: bool = false

var gun_sfx_index: int = 0

var sound_effects = {
	1: preload("res://assets/shoot1.wav"),
	2: preload("res://assets/shoot2.wav")
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):	
	var direction: Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		direction.y -= 1
		
	if Input.is_action_pressed("down"):
		direction.y += 1
		
	if Input.is_action_pressed("left"):
		direction.x -= 1
		
	if Input.is_action_pressed("right"):
		direction.x += 1
		
	direction = direction.normalized()
	
	if direction != Vector2.ZERO:
		velocity = direction * speed
		move_and_slide()
		look_at(global_position + direction)
		if not animation.is_playing():
			animation.play()
	else:
		if animation.is_playing():
			animation.stop()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("bubble"):
		shoot()

func shoot():
	create_bubble()
	play_shoot_sound()

func create_bubble():
	if Bubble:
		var bubble_inst = Bubble.instantiate()
		
		var direction = velocity.normalized()
		if direction == Vector2.ZERO:
			direction = Vector2.RIGHT

		emit_signal("cleaner_shot_bubble", bubble_inst, gun_tip.global_position, direction)
	else:
		print("Bubble scene not assigned")
		
func play_shoot_sound():
	sfx_player.stream = sound_effects.get(gun_sfx_index, null)
	gun_sfx_index = (gun_sfx_index + 1) % 3
	if sfx_player.stream:
		sfx_player.play()
		
func take_damage(amount: float):
	health = max(health - amount, 0.0)
	emit_signal("cleaner_health_change", health)
	print("Cleaner take_damage health: ", health)
	
	if health == 0:
		die()

func die():
	is_dead = true
	get_tree().change_scene_to_file("res://gameover.tscn")
