extends CanvasLayer


func _ready() -> void:
	%Pause.pressed.connect(pause_pressed)


func show_joystick():
	%VirtualJoystick.show()


func update_fatness(_fatness: int):
	%Fatness.text = "Fatness: " + str(_fatness)


func set_state(state: String):
	match state:
		"start":
			%Fatness.hide()
			%Pause.hide()
			if Global.is_mobile:
				%VirtualJoystick.hide()
			%PauseWindow.hide()
			%DeathWindow.hide()
		'pause':
			%Fatness.show()
			%Pause.hide()
			if Global.is_mobile:
				%VirtualJoystick.hide()
			%PauseWindow.show()
			%DeathWindow.hide()
		'death':
			%Fatness.show()
			%Pause.hide()
			if Global.is_mobile:
				%VirtualJoystick.hide()
			%PauseWindow.hide()
			%DeathWindow.show()
		'game':
			%Fatness.show()
			%Pause.show()
			if Global.is_mobile:
				%VirtualJoystick.show()
			%PauseWindow.hide()
			%DeathWindow.hide()


func pause_pressed():
	get_tree().paused = true
	set_state('pause')
