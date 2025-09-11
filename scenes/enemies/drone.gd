extends CharacterBody2D

func _process(_delta: float) -> void:
	velocity = Vector2.RIGHT * 200
	move_and_slide()
