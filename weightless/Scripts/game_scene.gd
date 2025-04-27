extends Node2D

var goblet_cracks = 0
var golden_goblet = 0
var current_soul = null

# @onready var soul_info = soul info
# @onready var goblet_sprite = animation for goblet

func _process(delta: float):
	if($music.playing == false):
		$music.play()
