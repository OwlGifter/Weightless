extends Node2D

var speed = 2

func _process(delta):
		var new_position = $Camera2D.position + Vector2(speed, 0)
		$Camera2D.position = new_position
		if($music.playing == false):
			$music.play()
		if($Camera2D.global_position.x > 5000):
			speed = 0
			pass
		


func _on_end_button_pressed() -> void:
	get_tree().quit()
