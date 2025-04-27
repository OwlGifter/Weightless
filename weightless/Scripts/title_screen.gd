extends Control

func _ready():
	if $music.playing == false:
		$music.play()


func _on_play_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/intro_scene.tscn")


func _on_exit_game_pressed() -> void:
	get_tree().quit()
