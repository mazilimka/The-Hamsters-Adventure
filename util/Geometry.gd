extends Node
class_name Geometry


static func rand_vec(x: float, y: float):
	return Vector2(randf_range(-x, x), randf_range(-y, y))
