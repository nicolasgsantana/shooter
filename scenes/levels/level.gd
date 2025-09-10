extends Node2D

const start_pos: Vector2 = Vector2(100, 200)
const start_angle: int = 45
var test_array: Array[String] = ["Hello", "World", "from", "Nuts", "Berserk"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Logo.rotation_degrees = start_angle
	
	for i in test_array:
		print(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Logo.rotation_degrees += 10 * delta
	if $Logo.position.x > 1000:
		$Logo.pos.x = start_pos.x
