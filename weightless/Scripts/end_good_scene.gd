extends Node2D

var speed = 5

func _process(delta):
		var new_position = $Camera2D.position + Vector2(speed, 0)
		$Camera2D.position = new_position
		if($Camera2D.global_position.x > 5000):
			speed = 0
			pass
