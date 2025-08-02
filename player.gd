extends CharacterBody2D

@export var speed = 80

func _process(delta):
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		input_vector.x += 1
	if Input.is_action_pressed("move_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("move_down"):
		input_vector.y += 1
	if Input.is_action_pressed("move_up"):
		input_vector.y -= 1

	input_vector = input_vector.normalized()
	velocity = input_vector * speed
	move_and_slide()

	if input_vector.length() > 0:
		$AnimatedSprite2D.animation = "run"
		$AnimatedSprite2D.flip_h = input_vector.x < 0
	else:
		$AnimatedSprite2D.animation = "idle"

	$AnimatedSprite2D.play()
