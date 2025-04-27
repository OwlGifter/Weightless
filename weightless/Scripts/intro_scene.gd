extends Node2D

var speed = 2

func _process(delta):
		var new_position = $Camera2D.position + Vector2(speed, 0)
		$Camera2D.position = new_position
		if($music.playing == false):
			$music.play()
		if($Camera2D.global_position.x > 2900):
			speed = 0
			pass


func _on_begin_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
	pass # Replace with function body.
