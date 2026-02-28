extends Area2D

var direction = Vector2.RIGHT
const SPEED = 800

func _physics_process(delta):
	position += direction * SPEED * delta
	
	# Remove off-screen bullets
	if position.x < -100 or position.x > 2000 or position.y < -100 or position.y > 2000:
		queue_free()
