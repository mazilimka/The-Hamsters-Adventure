extends Node2D

@onready var grain_scene := preload('res://Grains/grains.tscn')



func _ready() -> void:
	%TimerForGrains.timeout.connect(timer_for_grain_timeout)


func launch_grain():
	var grain_instance: Area2D = grain_scene.instantiate()
	add_child(grain_instance, true)
	grain_instance.set_grain()
	grain_instance.global_position = Vector2(randf_range(0, 1142), randf_range(0, 640))


func timer_for_grain_timeout():
	%TimerForGrains.wait_time = randf_range(2, 5)
	launch_grain()
