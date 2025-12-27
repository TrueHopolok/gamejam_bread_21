extends Node2D


'''
SFX todo:
	- Added for the night
	- Spawn on window
	- Close curtain
	- DEATH?

Animations / images todo:
	- Window
	- Curtain
	- Eyes in the window
'''


@onready var gm: GameManager = GameManager.get_instance()
@onready var gmconfig: DifficultyConfig = GameManager.get_config()
@onready var _attack_timer: Timer 	= $AttackTimer
@onready var _rest_timer: Timer 	= $RestTimer
var _attacking: bool = false


func _ready() -> void:
	if gmconfig.window_start_hour == 0:
		_on_start_end(0)
	else:
		get_tree().get_first_node_in_group("NightTimer").hour_passed.connect(_on_start_end)


func _on_start_end(hour: int) -> void:
	if hour == gmconfig.window_start_hour:
		_rest_timer.start(randf_range(gmconfig.window_min_rest_time, gmconfig.window_max_rest_time))


func _on_rest_end() -> void:
	_attacking = true
	_attack_timer.start(gmconfig.window_attack_time)
	print("WINDOW: spawn")


func _on_attack_end() -> void:
	if _attacking:
		gm.lose()
	else:
		_rest_timer.start(randf_range(gmconfig.window_min_rest_time, gmconfig.window_max_rest_time))


func _on_blind_press() -> void:
	if _attacking:
		_attack_timer.stop()
		_attacking = false
		_on_attack_end()
