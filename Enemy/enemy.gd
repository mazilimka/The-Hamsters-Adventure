extends Area2D


var speed := randf_range(200, 400)


func _ready() -> void:
	body_entered.connect(player_entered)


func _physics_process(delta: float) -> void:
	position.y += speed * delta


func set_random_sprite():
	$Sprites.get_children().pick_random().show()


func player_entered(body: CharacterBody2D):
	if body.is_in_group('Player'):
		body.death()
	
