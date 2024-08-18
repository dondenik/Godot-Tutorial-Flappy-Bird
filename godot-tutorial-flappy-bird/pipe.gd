extends Node2D

signal player_touched

func _ready() -> void:
	var base = self.get_node("Base")
	var head = self.get_node("Head")
	var min_pipe_height = 50 #Change this
	var max_pipe_height = 2500 #Change this
	head.position.y = -1*randi_range(min_pipe_height, max_pipe_height)
	base.scale.y = head.position.y / 320

func _process(delta: float) -> void:
	self.position.x -= 3240 * delta


func _on_area_2d_area_entered(area: Area2D) -> void:
	self.emit_signal("player_touched")


func _on_timer_timeout() -> void:
	self.queue_free()
