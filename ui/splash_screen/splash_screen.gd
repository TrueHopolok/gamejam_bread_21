extends Control

const MAIN_MENU = "res://ui/main_menu/main_menu.tscn"

@export var time_to_fade: float = 0.5
@export var time_between: float = 1.0

@onready var _transition_rect = $%TransitionRect

func _ready() -> void:
	_transition_rect.color.a = 1.0
	var tween1 = get_tree().create_tween()
	tween1.tween_property(_transition_rect, "color:a", 0.0, time_to_fade)
	tween1.tween_callback(func() -> void:
		get_tree().create_timer(time_between).timeout.connect(func() -> void:
			var tween2 = get_tree().create_tween()
			tween2.tween_property(_transition_rect, "color:a", 1.0, time_to_fade)
			tween2.tween_callback(func() -> void:
				get_tree().change_scene_to_file(MAIN_MENU)
			)
		)
	)
