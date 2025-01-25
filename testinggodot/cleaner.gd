extends CharacterBody2D

class_name Cleaner

@export var Bubble: PackedScene

@onready var gun_tip: Marker2D = $GunTip

signal cleaner_shot_bubble(bubble_inst, position, direction)

var speed: float = 500.0

var health: int = 100

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

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("bubble"):
		shoot()
	
func shoot():
	create_bubble()

func create_bubble():
	if Bubble:
		var bubble_inst = Bubble.instantiate()
		
		var direction = velocity.normalized()
		if direction == Vector2.ZERO:
			direction = Vector2.RIGHT

		emit_signal("cleaner_shot_bubble", bubble_inst, gun_tip.global_position, direction)
	else:
		print("Bubble scene not assigned")
