extends Node2D


func _process(delta: float) -> void:
	Global.oven_current_heat -= delta * Global.oven_cooling_speed
	if Global.oven_current_heat <= 0:
		# Global.lose()
		pass
	print(Global.oven_current_heat)


func _on_oven_pressed() -> void:
	if Global.player_has_log:
		Global.player_has_log = false
		Global.oven_current_heat = min(Global.oven_heating_per_log + Global.oven_current_heat, Global.oven_max_heat)
