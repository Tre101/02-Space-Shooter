extends Node2D



func _physics_process(delta):
	if get_child_count() == 0 and Global.Player != null:
		var player = Global.Player.instance()
		player.position = Vector2(Global.vp.x/2, Global.vp.y/2)
		add_child(player)
