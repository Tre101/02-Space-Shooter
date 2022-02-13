extends Control


func _ready():
	pass


func _on_Player_1_pressed():
	Global.Player = load("res://Player/Player1.tscn")
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_Player_2_pressed():
	Global.Player = load("res://Player/Player2.tscn")
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_Player_3_pressed():
	Global.Player = load("res://Player/Player3.tscn")
	var _scene = get_tree().change_scene("res://Game.tscn")
