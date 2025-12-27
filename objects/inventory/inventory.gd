extends Control


@onready var _log: Log = get_tree().get_first_node_in_group("Log")
@onready var _indicator: Label = $Indicator


func _process(_delta: float) -> void:
	_indicator.visible = _log.has_log
