extends Node

var difficulty : String = ""
var hints_enabled: bool = true
var death_reason: String = "THIS IS PROBABLY A BUG"


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&'main_menu'):
		get_tree().change_scene_to_file('res://ui/main_menu/main_menu.tscn')
