extends PanelContainer

func _ready() -> void:
	Hud.set_state('start')
	%Game.pressed.connect(game_button_pressed)
	title_tween()


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and not Global.is_mobile:
		Global.is_mobile = true
		Hud.show_joystick()


func title_tween():
	var tween_rot := get_tree().create_tween().set_loops(-1).set_ease(Tween.EASE_IN_OUT)
	tween_rot.tween_property(%Title, 'rotation', deg_to_rad(-10), 3)
	tween_rot.tween_property(%Title, 'rotation', deg_to_rad(+10), 3)
	
	var tween_scale := get_tree().create_tween().set_loops(-1).set_ease(Tween.EASE_IN_OUT)
	var scale_x = %Title.scale.x
	var scale_y = %Title.scale.y
	tween_scale.tween_property(%Title, 'scale', Vector2(scale_x + 0.3, scale_y + 0.3), 4)
	tween_scale.tween_property(%Title, 'scale', Vector2(scale_x, scale_y), 4)
	
	var tween_mod := get_tree().create_tween().set_loops(-1)
	tween_mod.tween_property(%Title, 'modulate', Color.YELLOW_GREEN, 2.5)
	tween_mod.tween_property(%Title, 'modulate', Color.ORANGE, 2.5)
	tween_mod.tween_property(%Title, 'modulate', Color.RED, 2.5)
	tween_mod.tween_property(%Title, 'modulate', Color.WHITE, 2)


func game_button_pressed():
	Hud.set_state('game')
	get_tree().change_scene_to_file('res://Main/main.tscn')
