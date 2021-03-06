extends Node


var vp = Vector2.ZERO
var score = 0
var lives = 5
var Player = null
var level = -1

var levels = [
	{
		"title": "Level 1",
		"subtitle": "Destory the meteors!",
		"meteors":[Vector2(100,100),Vector2(900,500)],
		"enemies":[],
		"timer":100,
		"meteors_spawned":false,
		"enemies_spawned":false,
	},
	{
		"title": "Level 2",
		"subtitle": "Destory the meteors and watch out for the enemies!",
		"meteors":[Vector2(100,100),Vector2(900,500),Vector2(800,200)],
		"enemies":[Vector2(150,500)],
		"timer":80,
		"meteors_spawned":false,
		"enemies_spawned":false,
	}
	
	
	
	
	
	
	
]

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	#vp = get_viewport().size
	vp = Vector2(1278,660)
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")
	reset()

func _physics_process(_delta):
	var m = get_node_or_null("/root/Game/Meteor_container")
	var e = get_node_or_null("/root/Game/Enemy_container")
	if m != null and e != null:
		var L = levels[level]
		if L["meteors_spawned"] and m.get_child_count() == 0 and L["enemies_spawned"] and e.get_child_count() == 0:
			next_level()

func reset():
	score = 0
	lives = 5
	level = -1
	for l in levels:
		l["meteors_spawned"] = false
		l["enemies_spawned"] = false


func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()


func _resize():
	#vp = get_viewport().size
	pass


func update_score(s):
	score += s
	var Score = get_node_or_null("/root/Game/UI/HUD/Score")
	if Score != null:
		Score.text = "Score " + str(score)

func update_lives(l):
	lives += l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var Lives = get_node_or_null("/root/Game/UI/HUD/Lives")
	if Lives != null:
		Lives.text = "Lives: " + str(lives)

func next_level():
	level += 1
	if level >= levels.size():
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	else:
		var level_label = get_node_or_null("/root/Game/UI/Level")
		if level_label != null:
			level_label.show_labels()

