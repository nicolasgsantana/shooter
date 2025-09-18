extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _on_gate_player_entered_gate(body: Node2D) -> void:
	print("player entered gate")
	print(body)

func _on_player_granade_launched() -> void:
	print("Laser shoot from level")

func _on_player_laser_shot(pos: Vector2) -> void:
	var laser: Node = laser_scene.instantiate()
	laser.position = pos 
	$Projectiles.add_child(laser)
