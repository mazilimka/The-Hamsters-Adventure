extends CanvasLayer

func _ready() -> void:
	if OS.has_feature('mobile'):
		%VirtualJoystick.show()
