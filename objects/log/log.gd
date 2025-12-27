extends Node2D


@onready var gm: GameManager = GameManager.get_instance()


func _on_button_pressed() -> void:
	gm.has_log = true
