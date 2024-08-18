extends Node2D

var pipe = load("res://pipe.tscn")
var score = 0

func _on_timer_timeout() -> void:
	score += 1
	self.get_node("score_ticker").text = str(score)
	var bottom_pipe = pipe.instantiate()
	bottom_pipe.position = Vector2(5800, 3240)
	var top_pipe = pipe.instantiate()
	top_pipe.position = Vector2(5800, -3240)
	top_pipe.rotation = PI
	self.add_child(bottom_pipe)
	self.add_child(top_pipe)
	bottom_pipe.connect("player_touched", player_touched)
	top_pipe.connect("player_touched", player_touched)

func player_touched():
	self.get_node("crash").show()
	get_tree().paused = true
