extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var jumps = 0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumps += 1
	
	if jumps < 1 and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		jumps += 1
		
	elif jumps >= 1 and Input.is_action_just_pressed("jump"):
		velocity.y = velocity.y
		
	if is_on_floor():
		jumps = 0
		
		


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	#activates animation
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play('jump')
	

	
	#flips sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	
	#applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
