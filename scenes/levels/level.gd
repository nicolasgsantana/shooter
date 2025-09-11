extends Node2D

func _on_gate_player_entered_gate(body: Node2D) -> void:
	print("player entered gate")
	print(body)


func _on_player_granade_launched() -> void:
	print("Laser shoot from level")

func _on_player_laser_shot() -> void:
	print("Granade launch from level")
