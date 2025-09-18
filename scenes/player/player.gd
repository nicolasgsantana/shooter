extends CharacterBody2D

var can_laser: bool = true
var can_granade: bool = true
signal laser_shot(pos: Vector2)
signal granade_launched

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_just_pressed('primary action') and can_laser:
		var laser_markers = $LaserStartingPositions.get_children()
		var selected_laser: Node2D = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserTimer.start()
		laser_shot.emit(selected_laser.global_position)

	if Input.is_action_just_pressed('secondary action') and can_granade:
		print('Shoot Granade')
		can_granade = false
		$GranadeTimer.start()
		granade_launched.emit()

func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_granade_timer_timeout() -> void:
	can_granade = true
