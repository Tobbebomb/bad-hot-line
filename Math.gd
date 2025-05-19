class_name Math extends Node

const CIRCLE_RADIANS: float = 6.28

static func get_four_direction_vector(diagonal_allowed: bool) -> Vector2:
	var velocity: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	if diagonal_allowed or is_zero_approx(velocity.x):
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
		elif Input.is_action_pressed("ui_down"):
			velocity.y += 1
	
	return velocity

static func get_random_rotation() -> float:
	return randf_range(0, CIRCLE_RADIANS)

static func approach(val1, val2, amount):
	var value
	if val1 < val2:
		value = min(val1 + amount, val2)
	elif val1 > val2:
		value = max(val1 - amount, val2)
	else:
		value = val1
	return value

static func convert_in_to_cm(value, step: float) -> float:
		return snappedf(value * 2.54, step)

static func convert_lb_to_kg(value, step: float) -> float:
		return snappedf(value * 0.453592, step)

static func add_with_random_spreadi(value: int, spread: int) -> int:
	return value + randi_range(-spread, spread)

static func add_with_random_spreadf(value: float, spread: float) -> float:
	return value + randf_range(-spread, spread)
