extends Node2D
# Ammit
@onready var animation = $Ammit/AnimationPlayer


#text fields
@onready var SoulResponse = $"Soul Response"
@onready var BookAnswers = $"Book Answers"
# Chalice
@onready var aniChalice = $ChaliceSurface/AnimationPlayer # pool on challice
@onready var aniSoul = $Soul/AnimationPlayer2 # soul above chalice
@onready var aniGold0 = $"Chalice/AnimationPlayer" # Make it Gray out

#questions available
var questionsAvailable = 2

# Chalice Gold Stages
var stage = 0

#wrong count
var guessedWrong = 0
#right count
var guessedRight = 0

#all Soul answers
var answersAge = [
	"40",
	"2000",
	"10",
	"70",
	"45000",
	""
]
var answersCauseOfDeath = [
	"Tripped",
	"Poked",
	"Car",
	"Oxygen",
	"Contract",
	""
]
var answersGoodDeed = [
	"Saved a Life",
	"Helped a person",
	"Helped my friend",
	"Protected my Country",
	"Followed an order",
	""
]
var answersBadDeed = [
	"laid someone to rest",
	"tricked someone",
	"lost a pencil",
	"killed a person",
	"forgot something important",
	""
]

#all Book answers
var BookanswersAge = [
	"40",
	"4000",
	"9",
	"85",
	"100,000",
	""
]
var BookanswersCauseOfDeath = [
	"Pushed off ledge",
	"Shot",
	"Car Accident",
	"Old Age",
	"Burned",
	""
]
var BookanswersGoodDeed = [
	"Helped someone with an injury",
	"Helped a person",
	"Helped a friend",
	"Brave",
	"None",
	""
]
var BookanswersBadDeed = [
	"Killed",
	"tricked someone",
	"lost a pencil",
	"Torture",
	"Left someone to Die",
	""
]

var CurrentSoul = 0


func _process(_delta: float):
	aniChalice.play("Surface_Soul")
	aniSoul.play("Soul")
	pass
	if($music.playing == false):
		$music.play()
	if not NoSoulRemaining():
		BookAnswers.text = BookanswersAge[CurrentSoul]+','+BookanswersCauseOfDeath[CurrentSoul]+','+BookanswersGoodDeed[CurrentSoul]+','+BookanswersBadDeed[CurrentSoul]


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
	questionsAvailable = 2
	animation.play("Bite Ammit")
	if(CurrentSoul == 0):
		guessedRight +=1
	elif(CurrentSoul == 1):
		guessedRight +=1
	elif(CurrentSoul == 4):
		guessedRight +=1
	else:
		guessedWrong +=1
	CurrentSoul +=1
	if(NoSoulRemaining()):
		if(guessedRight > 2):
			get_tree().change_scene_to_file("res://Scenes/end_good_scene.tscn")
		if(guessedWrong > 2):
			get_tree().change_scene_to_file("res://Scenes/end_bad_scene.tscn")
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


#Good Button Pressed
func _on_good_pressed() -> void:
	questionsAvailable = 2
	if(CurrentSoul == 2):
		guessedRight +=1
	elif(CurrentSoul == 3):
		guessedRight +=1
	else:
		guessedWrong +=1
	CurrentSoul +=1
	if(NoSoulRemaining()):
		if(guessedRight > 2):
			get_tree().change_scene_to_file("res://Scenes/end_good_scene.tscn")
		if(guessedWrong > 2):
			get_tree().change_scene_to_file("res://Scenes/end_bad_scene.tscn")
	pass # Replace with function body.
	
func NoSoulRemaining() -> bool:
	if(CurrentSoul == 5):
		return true
	return false

func checkNextSceneCond() -> void:
	if(guessedRight > 2):
		get_tree().change_scene_to_file("res://Scenes/end_good_scene.tscn")
	if(guessedWrong > 2):
		get_tree().change_scene_to_file("res://Scenes/end_bad_scene.tscn")
	pass
