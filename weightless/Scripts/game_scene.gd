extends Node2D
# Ammit
@onready var animation = $Ammit/AnimationPlayer

# Chalice
@onready var aniChalice = $ChaliceSurface/AnimationPlayer # pool on challice
@onready var aniSoul = $Soul/AnimationPlayer2 # soul above chalice
@onready var aniGold0 = $"Chalice/AnimationPlayer" # Make it Gray out

# Chalice Gold Stages
var stage = 0

func _process(delta: float):
	# idle animations basically 
	aniChalice.play("Surface_Soul")
	aniSoul.play("Soul")

	#if($music.playing == false):
		#$music.play()

func _on_gold__button_pressed() -> void:
	stage += 1
	update_cup()

func update_cup():
	if stage == 0:
		pass
	elif stage == 1:
		$Gold1.texture = preload("res://art/chalice_overlay_gold_2.png")
	elif stage == 2:
		$Gold1.texture = preload("res://art/chalice_overlay_gold_4.png")
	elif stage == 3:
		$Gold1.texture = preload("res://art/chalice_overlay_gold_5.png")

func _on_ammit_chompa_button_pressed() -> void:
	animation.play("Bite Ammit")
	pass # Replace with function body.
