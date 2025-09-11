extends CharacterBody2D

var can_laser: bool = true
var can_granade: bool = true

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_just_pressed('primary action') and can_laser:
		print('Shoot Laser')
		can_laser = false
		$LaserTimer.start()
	if Input.is_action_just_pressed('secondary action') and can_granade:
		print('Shoot Granade')
		can_granade = false
		$GranadeTimer.start()


func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_granade_timer_timeout() -> void:
	can_granade = true
