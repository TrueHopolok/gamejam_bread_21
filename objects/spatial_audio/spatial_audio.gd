class_name SpatialAudioSource
extends AudioStreamPlayer2D


enum Opos {LL, L, M, R, RR}
@export var pos: Opos = Opos.M
@onready var gm: GameManager = GameManager.get_instance()


func _ready() -> void:
	match pos:
		Opos.L:
			_set_LL()
		Opos.M:
			_set_L()
		Opos.R:
			_set_M()
		_:
			print("IMPOSSIBLE SPATIAL MOVE")
	gm.moved_left.connect(_on_moved_L)
	gm.moved_right.connect(_on_moved_R)


# Testing output
#func _process(_delta: float) -> void:
	#print(volume_linear, "  |  pos: ", pos)


func _set_LL() -> void:
	pos = Opos.LL
	global_position.x = 0
	global_position.y = 360


func _set_L() -> void:
	pos = Opos.L
	global_position.x = 0
	global_position.y = 0


func _set_M() -> void:
	pos = Opos.M
	global_position.x = 320
	global_position.y = 0


func _set_R() -> void:
	pos = Opos.R
	global_position.x = 640
	global_position.y = 0


func _set_RR() -> void:
	pos = Opos.RR
	global_position.x = 640
	global_position.y = 360


func _on_moved_R() -> void:
	match pos:
		Opos.RR:
			_set_R()
		Opos.R:
			_set_M()
		Opos.M:
			_set_L()
		Opos.L:
			_set_LL()
		_:
			print("IMPOSSIBLE SPATIAL MOVE")


func _on_moved_L() -> void:
	match pos:
		Opos.LL:
			_set_L()
		Opos.L:
			_set_M()
		Opos.M:
			_set_R()
		Opos.R:
			_set_RR()
		_:
			print("IMPOSSIBLE SPATIAL MOVE")
