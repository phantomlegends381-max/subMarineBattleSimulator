extends CharacterBody2D

const SPEED = 300
@onready var sprite = $Sprite2D
@onready var bullet_spawn = $BulletSpawn
var bullet_scene: PackedScene = preload("res://Bullet.tscn")

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	# Movement
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	
	direction = direction.normalized()
	velocity = direction * SPEED
	move_and_slide()
	
	# Flip ship and bullet spawn point
	if direction.x > 0:
		sprite.flip_h = false
		bullet_spawn.position.x = abs(bullet_spawn.position.x)  # front
	elif direction.x < 0:
		sprite.flip_h = true
		bullet_spawn.position.x = -abs(bullet_spawn.position.x) # front when flipped
	
	# Shoot bullets
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = bullet_spawn.global_position
	
	# Shoot in facing direction
	if sprite.flip_h:
		bullet.direction = Vector2.RIGHT
	else:
		bullet.direction = Vector2.LEFT
	
	get_tree().current_scene.add_child(bullet)
