extends CharacterBody3D
const charSpeed = 6
const stop = 0
const ROTSPEED = deg_to_rad(9)
const jumpSpeed = 10.0
var isJumping = false
const GRAVITY = 9.8

func _ready():
	pass


func _physics_process(delta):
	# this function is the main function for the game it contans the main controls and movement mechanics that we will
	# be needing for this game
	velocity = Vector3.ZERO
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = stop
	elif Input.is_action_pressed("ui_right"):
		velocity.x = charSpeed
		$MeshInstance3D.rotate_y(ROTSPEED)

	elif Input.is_action_pressed("ui_left"):
		velocity.x = -charSpeed
		$MeshInstance3D.rotate_y(-ROTSPEED)

	else:
		lerp(velocity.x, 0.0, 0.1)

	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = stop
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -charSpeed
		$MeshInstance3D.rotate_x(-ROTSPEED)

	elif Input.is_action_pressed("ui_down"):
		velocity.z = charSpeed
		$MeshInstance3D.rotate_x(ROTSPEED)


	if Input.is_action_pressed("ui_accept"):
		isJumping = true

	if isJumping:
		velocity.y = jumpSpeed
		isJumping = false
	velocity.y -= 99.8 * delta  # Adjust gravity as needed

	if is_on_floor():
		velocity.y = 0.0

	lerp(velocity.z, 0.0, 0.1)
	lerp(velocity.x, 0.0, 0.1)

	move_and_collide(velocity * delta)
