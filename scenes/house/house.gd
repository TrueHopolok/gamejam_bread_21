extends Node2D

func _ready() -> void:
	%TransitionRect.color.a = 1.0
	$RightRoom.enter()
