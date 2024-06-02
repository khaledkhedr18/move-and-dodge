extends CharacterBody3D
var charSpeed = 6
var stop = 0

func _ready():
	pass


func _physics_process(delta):
	# this function is the main function for the game it contans the main controls and movement mechanics that we will
	# be needing for this game
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = stop
	elif Input.is_action_pressed("ui_right"):
		velocity.x = charSpeed
		velocity.z = stop
		print("right arrow pressed and velocity is adjusted to ", velocity.x)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -charSpeed
		velocity.z = stop
		print("left arrow pressed and velocity is adjusted to ", velocity.x)
	else:
		lerp(velocity.x, 0.0, 0.1)

	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = stop
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -charSpeed
		velocity.x = stop
		print("up arrow pressed and velocity is adjusted to ", velocity.z)
	elif Input.is_action_pressed("ui_down"):
		velocity.z = charSpeed
		velocity.x = stop
		print("down arrow pressed and velocity is adjusted to ", velocity.z)
	else:
		lerp(velocity.z, 0.0, 0.1)

	move_and_slide()
