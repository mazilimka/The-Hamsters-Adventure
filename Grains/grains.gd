extends Area2D


func _ready() -> void:
	body_entered.connect(player_entered)


func set_grain():
	get_children().pick_random().show()


func player_entered(body: CharacterBody2D):
	if body.is_in_group('Player'):
		Global.Score += 1
		Hud.update_score(Global.Score)
		queue_free()
