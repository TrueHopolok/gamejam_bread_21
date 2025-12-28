extends Control


@onready var _oven: Oven = get_tree().get_first_node_in_group("Oven")
@onready var _indicator: Label = $Indicator


func _process(_delta: float) -> void:
	_indicator.visible = _oven.has_log
