extends Node2D


@onready var gm: GameManager = GameManager.get_instance()
@onready var _start_timer: Timer 	= $StartTimer
@onready var _attack_timer: Timer 	= $AttackTimer
@onready var _rest_timer: Timer 	= $RestTimer
@onready var _blind_button: Button 	= $BlindButton
var _attacking: bool = false


func _ready() -> void:
	_start_timer.start(gm.config.window_start_time)


func _on_rest_end() -> void:
	_attacking = true
	_attack_timer.start(gm.config.window_attack_time)


func _on_attack_end() -> void:
	if _attacking:
		# TODO: gm.lose()
		pass
	_rest_timer.start(randf_range(gm.config.window_min_rest_time, gm.config.window_max_rest_time))


func _process(_delta: float) -> void:
	if _attacking && _blind_button.pressed:
		_attack_timer.stop()
		_attacking = false
		_on_attack_end()
