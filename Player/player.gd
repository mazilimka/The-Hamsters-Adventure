extends CharacterBody2D

@export var speed := 330.0
var direction: Vector2


func _physics_process(delta: float) -> void:
	direction = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down').normalized()
	direction = quantize_direction(direction)
	
	velocity += direction * speed * delta
	move_and_slide()
	
	if velocity.length() > speed:
		velocity = velocity.normalized() * speed
	
	if direction == Vector2.ZERO:
		velocity = Vector2.ZERO
	
	velocity.x = move_toward(velocity.x, speed * direction.x, speed)
	velocity.y = move_toward(velocity.y, speed * direction.y, speed)


func quantize_direction(_dir: Vector2):
	if _dir == Vector2.ZERO:
		return Vector2.ZERO
	
	var angle := _dir.angle()
	var step := PI / 4
	var quantized_angle = round(angle / step) * step
	
	return Vector2(cos(quantized_angle), sin(quantized_angle))