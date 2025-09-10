extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector('left', 'right', 'up', 'down')
	position += (direction * 200) * delta
	
	if Input.is_action_just_pressed('primary action'):
		print('Shoot Laser')
	if Input.is_action_just_pressed('secondary action'):
		print('Shoot Granade')
