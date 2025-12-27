class_name Oven
extends Node2D


'''
SFX todo:
	- Ambient fire cracking (depending on amount of fuel)

Animations / images:
	- Glow (depending on amount of fuel)
	- Oven itself
	- Fire inside
'''


@onready var gm: GameManager = GameManager.get_instance()
@onready var gmconfig: DifficultyConfig = GameManager.get_config()
@onready var heat: float = gmconfig.oven_starting_heat
@onready var brevno: Log = get_tree().get_first_node_in_group("Log")


func _process(delta: float) -> void:
	heat -= delta * gmconfig.oven_cooling_speed
	if heat <= 0:
		gm.lose()


func _on_oven_pressed() -> void:
	if brevno.has_log:
		brevno.has_log = false
		heat = min(heat + gmconfig.oven_heating_per_log, gmconfig.oven_max_heat)
