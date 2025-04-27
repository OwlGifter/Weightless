extends Node2D

var goblet_cracks = 0
var golden_goblet = 0
var current_soul = null

# @onready var soul_info = soul info
# @onready var goblet_sprite = animation for goblet

func _process(delta: float):
	if($music.playing == false):
		$music.play()

func ready():
	if($music.playing == false):
		$music.play()
	spawn_new_soul()
	pass

func spawn_new_soul():
	pass
#current_soul = (Create soul object) Soul.new()

func judge_soul(justified: bool):
	if(current_soul.goToHeaven == justified):
		golden_goblet += 1
		pass
	else:
		goblet_cracks += 1
		update_goblet()
		check_game_end()
		spawn_new_soul()
		pass

func update_goblet():
	if goblet_cracks == 1:
		pass
	#goblet sprite loads the small cracked goblet
	elif goblet_cracks == 2:
		pass
	#same thing but moderate cracked
	elif goblet_cracks >= 3:
		pass
	# broken goblet:
	elif golden_goblet == 1:
		pass
	# golden goblet starts getting gold
	elif golden_goblet == 3:
		pass
	#golden goblet enters second transformation
	elif golden_goblet == 5:
		pass
	#goblet turns full golden

func check_game_end():
	pass
