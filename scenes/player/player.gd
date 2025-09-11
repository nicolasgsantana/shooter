extends CharacterBody2D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_just_pressed('primary action'):
		print('Shoot Laser')
	if Input.is_action_just_pressed('secondary action'):
		print('Shoot Granade')
