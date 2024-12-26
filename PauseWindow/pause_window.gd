extends PanelContainer


func _ready() -> void:
	%Continue.pressed.connect(continue_pressed)


func continue_pressed():
	get_tree().paused = false
	Hud.set_state('game')
