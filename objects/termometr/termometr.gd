extends ProgressBar


@onready var gm: GameManager = GameManager.get_instance()


func _process(_delta: float) -> void:
	value = min(gm.heat, 100.0)
