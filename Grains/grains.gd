extends Area2D


func _ready() -> void:
	body_entered.connect(player_entered)


func set_grain():
	$Sprites.get_children().pick_random().show()


func player_entered(body: CharacterBody2D):
	if body.is_in_group('Player'):
		Global.player_increase += 1
		body.increasing()
		if Global.player_increase % 2 == 0:
			Global.Fatness += 1
		Hud.update_fatness(Global.Fatness)
		queue_free()
