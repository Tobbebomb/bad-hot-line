extends CharacterBody2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@export var move_speed = 200

var dead = false

func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	if Input.is_action_just_pressed("restart"):
		restart()
	if dead:
		return
	
	global_rotation = global_position.direction_to(get_global_mouse_position()).angle() + PI/2.0
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	if dead:
		return
	var move_dir = Input.get_vector("move left","move right","move up","move down")
	velocity = move_dir * move_speed
	move_and_slide()

func kill():
	if dead:
		return
	dead = true
	$DeathSound.play()
	$Graphics/Dead.show()
	$Graphics/Alive.hide()
	$CanvasLayer/DeathScreen.show()
	z_index = -1

func restart():
	get_tree().reload_current_scene()

func shoot():
	$MuzzleFlash.show()
	$MuzzleFlash/Timer.start()
	$ShootSound.play()
	if ray_cast_2d.is_colliding():
		var collider = ray_cast_2d.get_collider()
		if collider.has_method("kill"):
			collider.kill()
