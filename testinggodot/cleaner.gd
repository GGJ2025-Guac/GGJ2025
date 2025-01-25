extends CharacterBody2D

var speed: float = 500.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		var direction: Vector2 = Vector2.ZERO
		
		var e2: InputEventKey = event
		if e2.keycode == KEY_UP:
			direction.y -= 1
		elif e2.keycode == KEY_DOWN:
			direction.y += 1
		elif e2.keycode == KEY_LEFT:
			direction.x -= 1
		elif e2.keycode == KEY_RIGHT:
			direction.x += 1
			
		direction = direction.normalized()
		
		if direction != Vector2.ZERO:
			velocity = direction * speed
			move_and_slide()
