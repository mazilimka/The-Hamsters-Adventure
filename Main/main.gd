extends Node2D

@onready var grain_scene := preload('res://Grains/grains.tscn')
@onready var enemy_scene := preload('res://Enemy/enemy.tscn')

var timer := 0.0
var increse_timer := 3
var decrease_time := 0.1
var random_time := randf_range(2, 4)

func _ready() -> void:
	%TimerForGrains.timeout.connect(timer_for_grain_timeout)
	%TimerForEnemies.timeout.connect(timer_for_enemies_timeout)


func _process(delta: float) -> void:
	timer += delta
	if timer == increse_timer:
		random_time - decrease_time
		%TimerForGrains.wait_time = random_time
		timer = 0
		increse_timer += 3


func launch_grain():
	var grain_instance: Area2D = grain_scene.instantiate()
	add_child(grain_instance, true)
	grain_instance.set_grain()
	grain_instance.global_position = Vector2(randf_range(0, 1142), randf_range(0, 640))


func launch_enemy():
	var enemy_instance: Area2D = enemy_scene.instantiate()
	add_child(enemy_instance, true)
	enemy_instance.global_position = Vector2(randf_range(40, 1100), -20)
	enemy_instance.set_random_sprite()


func timer_for_grain_timeout():
	%TimerForGrains.wait_time = randf_range(1, 3)
	launch_grain()


func timer_for_enemies_timeout():
	launch_enemy()
