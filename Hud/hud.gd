extends CanvasLayer


func _ready() -> void:
	if OS.has_feature('mobile'):
		%VirtualJoystick.show()


func update_score(_score: int):
	%Score.text = str(_score)
