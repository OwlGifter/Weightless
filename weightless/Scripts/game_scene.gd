extends Node2D


@onready var animation = $Ammit/AnimationPlayer

func _process(delta):
	pass


func _on_button_pressed() -> void:
	animation.play("Bite Ammit")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	
	pass # Replace with function body.
