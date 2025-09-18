extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/granade.tscn")

func _on_gate_player_entered_gate(body: Node2D) -> void:
	print("player entered gate")
	print(body)

func _on_player_granade_launched(pos: Vector2, dir: Vector2) -> void:
	var grenade: RigidBody2D = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.speed
	$Projectiles.add_child(grenade)

func _on_player_laser_shot(pos: Vector2, dir: float) -> void:
	var laser: Area2D = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation = dir
	$Projectiles.add_child(laser)
