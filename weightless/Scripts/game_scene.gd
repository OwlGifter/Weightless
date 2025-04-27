extends Node2D
@onready var animation = $Ammit/AnimationPlayer


func _process(delta: float):
	if($music.playing == false):
		$music.play()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	animation.play("Bite Ammit")
	pass # Replace with function body.
