extends Sprite2D

var pos: Vector2 = Vector2(100, 200);
const speed: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pos.x += speed * delta
	position = pos
	
