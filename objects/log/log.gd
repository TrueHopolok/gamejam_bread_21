class_name Log
extends Node2D


@onready var oven: Oven = get_tree().get_first_node_in_group("Oven")


func _on_button_pressed() -> void:
	if !oven.has_log:
		oven.has_log = true
		queue_free()
