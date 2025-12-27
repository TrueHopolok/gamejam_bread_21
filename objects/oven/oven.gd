extends Node2D

func _process(delta: float) -> void:
	GlobalVariables.heat -= delta
	print(GlobalVariables.heat)

func _on_oven_pressed() -> void:
	if GlobalVariables.has_log:
		GlobalVariables.has_log = false
		GlobalVariables.heat += 5
