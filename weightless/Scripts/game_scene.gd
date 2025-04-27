extends Node2D
@onready var animation = $Ammit/AnimationPlayer
@onready var aniChalice = $Chalice/ChaliceSurface/AnimationPlayer
@onready var aniSoul = $Soul/AnimationPlayer2

#text fields
@onready var SoulResponse = $"Soul Response"
@onready var BookAnswers = $"Book Answers"

#questions available
var questionsAvailable = 2

#all Soul answers
var answersAge = [
	"40",
	"2000",
	"10",
	"70",
	"45000"
]
var answersCauseOfDeath = [
	"Tripped",
	"Poked",
	"Car",
	"Oxygen",
	"Contract"
]
var answersGoodDeed = [
	"Saved a Life",
	"Helped a person",
	"Helped my friend",
	"Protected my Country",
	"Followed an order"
]
var answersBadDeed = [
	"laid someone to rest",
	"tricked someone",
	"lost a pencil",
	"killed a person",
	"forgot something important"
]

#all Book answers
var BookanswersAge = [
	"40",
	"4000",
	"9",
	"85",
	"100,000"
]
var BookanswersCauseOfDeath = [
	"Pushed off ledge",
	"Shot",
	"Car Accident",
	"Old Age",
	"Burned"
]
var BookanswersGoodDeed = [
	"Saved a Life",
	"Helped a person",
	"Helped a friend",
	"Brave",
	"None"
]
var BookanswersBadDeed = [
	"Killed",
	"tricked someone",
	"lost a pencil",
	"Torture",
	"Left someone to Die"
]

var CurrentSoul = 0


func _process(delta: float):
	aniChalice.play("Surface_Soul")
	aniSoul.play("Soul")
	pass
	if($music.playing == false):
		$music.play()
	BookAnswers.text = BookanswersAge[CurrentSoul]+','+BookanswersCauseOfDeath[CurrentSoul]+','+BookanswersGoodDeed[CurrentSoul]+','+BookanswersBadDeed[CurrentSoul]

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	animation.play("Bite Ammit")
	pass # Replace with function body.


func _on_age_pressed() -> void:
	if(outOfQuestions()):
		return
	questionsAvailable -= 1
	SoulResponse.text = answersAge[CurrentSoul]
	pass # Replace with function body.


func _on_cause_of_death_pressed() -> void:
	if(outOfQuestions()):
		return
	questionsAvailable -= 1
	SoulResponse.text = answersCauseOfDeath[CurrentSoul]
	pass # Replace with function body.


func _on_good_deeds_pressed() -> void:
	if(outOfQuestions()):
		return
	questionsAvailable -= 1
	SoulResponse.text = answersGoodDeed[CurrentSoul]
	pass # Replace with function body.


func _on_bad_deeds_pressed() -> void:
	#checks if out of questions
	if(outOfQuestions()):
		return
	questionsAvailable -= 1
	SoulResponse.text = answersBadDeed[CurrentSoul]
	pass # Replace with function body.

func outOfQuestions() -> bool:
	if(questionsAvailable < 1):
		return true
	return false
