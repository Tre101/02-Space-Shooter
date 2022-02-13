extends KinematicBody2D

onready var Enemy_laser = load("res://Enemy/Enemy1_laser.tscn")
var nose = Vector2(0,-30)
var health = 8

var score = 100

func _ready():
	pass

func damage(d):
	health -= d
	if health <= 0:
		Global.update_score(score)
		queue_free()

func _on_Timer_timeout():
	var Player = get_node_or_null("/root/Game/Player_container/Player")
	var Effects = get_node_or_null("/root/Game/Effects")
	if Player != null and Effects != null:
		var dir = global_position.angle_to_point(Player.global_position) - PI/2
		var enemy_laser = Enemy_laser.instance()
		enemy_laser.global_position = global_position + nose.rotated(dir)
		enemy_laser.rotation = dir
		Effects.add_child(enemy_laser)
