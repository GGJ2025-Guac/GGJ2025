extends CharacterBody2D

@export var Bubble: PackedScene

@onready var gun_tip: Marker2D = $GunTip

signal cleaner_shot_bubble(bubble)

var speed: float = 500.0

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
		
		bubble_inst.global_position = gun_tip.global_position
		
		if bubble_inst.has_method("set_velocity"):
			bubble_inst.set_velocity(direction * 200)
		else:
			print("Bubble does not have set_velocity")
		
		emit_signal("cleaner_shot_bubble", bubble_inst)
	else:
		print("Bubble scene not assigned")
