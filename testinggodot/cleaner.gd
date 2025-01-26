extends CharacterBody2D

class_name Cleaner

@export var Bubble: PackedScene

@onready var gun_tip: Marker2D = $GunTip

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

signal cleaner_shot_bubble(bubble_inst, position, direction)

signal cleaner_health_change(health)

var speed: float = 500.0
var health: float = 100.0
var is_dead: bool = false
var rapid_fire: bool = false
var bubble_path = preload("res://bubble.tscn")

var timer = null
var bullet_delay = 0.5
var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.set_one_shot(true)
	timer.set_wait_time(bullet_delay)
	timer.connect("timeout", Callable(self, "_on_timeout_complete"))

func _on_timeout_complete():
	can_shoot = true
	
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
	
func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("bubble") && can_shoot:
		shoot()
		
func shoot():
	var bubble = bubble_path.instantiate()
	bubble.direction = rotation
	bubble.pos = global_position
	bubble.rot = global_rotation
	get_parent().add_child(bubble)
	can_shoot = false
	timer.start()
	print("Delay value", bullet_delay)
	
func take_damage(amount: float):
	health = max(health - amount, 0.0)
	emit_signal("cleaner_health_change", health)
	print("Cleaner take_damage health: ", health)
	
	if health == 0:
		die()

func die():
	is_dead = true
	get_tree().change_scene_to_file("res://gameover.tscn")
	
func enable_rapid_fire():
	rapid_fire = true
	bullet_delay = 0.05
	print("Rapid fire enabled")
