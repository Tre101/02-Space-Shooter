extends Node2D

onready var Meteor = load("res://Meteor/Meteor.tscn")

func _physics_process(_delta):
	if get_child_count() == 0 and Global.level < Global.levels.size():
		var level = Global.levels[Global.level]
		if not level["meteors_spawned"]:
			for pos in level["meteors"]:
				var meteor = Meteor.instance()
				meteor.position = pos
				add_child(meteor)
			level["meteors_spawned"] = true
