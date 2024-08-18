extends Sprite2D

var velocity = 0

func _process(delta: float) -> void:
	self.velocity += 100
	self.position.y += velocity * delta
	self.rotation = (PI/4.0) * (velocity / 2500.0)  

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		self.velocity -= 2500
