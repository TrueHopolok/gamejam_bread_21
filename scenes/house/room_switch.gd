class_name Room
extends Node2D

@export var room_to_the_left: Room
@export var room_to_the_right: Room
@export var transition_time: float = 1.0 # seconds (TODO: switch to global var)
@export var unswitchable_time: float = 1.0 #seconds (TODO: switch to global var)


@onready var _transition_rect: ColorRect = %TransitionRect
var _ignore_input: bool = true


func _input(event: InputEvent) -> void:
	if _ignore_input: return
	if event.is_action_pressed("move_left"):
		if is_instance_valid(room_to_the_left):
			_leave(true)
	elif event.is_action_pressed("move_right"):
		if is_instance_valid(room_to_the_right):
			_leave(false)


func _leave(move_left: bool) -> void:
	# TODO: Global.immune(true)
	_ignore_input = true
	var tween = get_tree().create_tween()
	tween.tween_property(_transition_rect, "color:a", 1.0, transition_time / 2)
	tween.tween_callback(hide)
	tween.tween_callback(room_to_the_left.enter if move_left else room_to_the_right.enter)


func enter() -> void:
	show()
	var tween = get_tree().create_tween()
	tween.tween_property(_transition_rect, "color:a", 0.0, transition_time / 2)
	tween.tween_callback(func() -> void:
		# TODO: Global.immune(false)
		await get_tree().create_timer(unswitchable_time).timeout
		_ignore_input = false
	)
