extends Node2D


var speed = 2
var wait_time = 2.5 # seconds to wait before moving between murals
var timer = 0.0
var moving = false

func _process(delta):
	if not moving:
		timer += delta
		if timer >= wait_time:
			moving = true
	else:
		var new_position = $Camera2D.position + Vector2(speed, 0)
		$Camera2D.position = new_position
		if $Camera2D.global_position.x > 1200:
			speed = 0
