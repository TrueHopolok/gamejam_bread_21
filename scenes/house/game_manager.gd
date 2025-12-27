class_name GameManager
extends Node2D

var heat: float = 100.0
var has_log: bool = false
var wordle_chance: float = 0.5


static func get_instance() -> GameManager:
	return Engine.get_main_loop().get_first_node_in_group("GameManager")


func _ready() -> void:
	%TransitionRect.color.a = 1.0
	$RightRoom.enter()
