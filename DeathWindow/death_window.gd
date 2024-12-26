extends PanelContainer


func _ready() -> void:
	%TryAgain.pressed.connect(try_again_pressed)


func try_again_pressed():
	get_tree().reload_current_scene()
	#get_tree().paused = false
	Hud.set_state('game')
