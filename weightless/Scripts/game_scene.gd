extends Node2D
@onready var animation = $Ammit/AnimationPlayer
@onready var aniChalice = $Chalice/ChaliceSurface/AnimationPlayer
@onready var aniSoul = $Soul/AnimationPlayer2


func _process(delta: float):
	aniChalice.play("Surface_Soul")
	aniSoul.play("Soul")
	pass
	#if($music.playing == false):
		#$music.play()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	animation.play("Bite Ammit")
	pass # Replace with function body.
