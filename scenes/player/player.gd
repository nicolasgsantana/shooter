extends CharacterBody2D

var can_laser: bool = true
var can_granade: bool = true
signal laser_shot(pos: Vector2, angle: float)
signal granade_launched(pos: Vector2, dir: Vector2)

func _process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * 500
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed('primary action') and can_laser:
		var markers = $LaserStartingPositions.get_children()
		var selected_marker: Node2D = markers[randi() % markers.size()]
		can_laser = false
		$LaserTimer.start()
		laser_shot.emit(selected_marker.global_position, rotation)

	if Input.is_action_just_pressed('secondary action') and can_granade:
		var markers = $LaserStartingPositions.get_children()
		var selected_marker: Node2D = markers[randi() % markers.size()]
		var dir: Vector2 = (get_global_mouse_position() - position).normalized()
		can_granade = false
		$GranadeTimer.start()
		granade_launched.emit(selected_marker.global_position, dir)

func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_granade_timer_timeout() -> void:
	can_granade = true
