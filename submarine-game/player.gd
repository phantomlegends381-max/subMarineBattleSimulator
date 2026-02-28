extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:



	# Handle jump.
	if Input.is_action_just_pressed("up"):
		velocity.y = SPEED
	if Input.is_action_just_pressed("down"):
		velocity.y = -SPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
