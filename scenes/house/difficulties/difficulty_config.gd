class_name DifficultyConfig
extends Resource


## Overall difficulty modifiers for the night.
@export_group("OverallNight")
## Length of the hour in seconds.
@export_range(10.0, 120.0, 0.5) var night_hour_length: float = 40.0

## Movement based modifiers, preferably do not touch.
@export_subgroup("MovementBased")
## How fast you can move through the rooms.
@export_range(0.05, 1.00, 0.05) var room_transition_time: float = 0.25
## How long you can't move after moving to the room.
## Required, since otherwise you are immune to dying.
@export_range(0.05, 1.00, 0.05) var room_unswitchable_time: float = 0.25



## Oven difficulty related variables.
## Maximum units amount in the oven is 120 and starting is 100.
@export_group("Oven")
## How fast oven cool down in units/second. More info in group's doc.
@export_range(0.0, 10.0, 0.05) var oven_cooling_speed: float = 1.5
## How much 1 log restores units of warmth. More info in group's doc.
@export_range(0.0, 100.0, 1.0) var oven_heating_per_log: float = 75.0
## Max amount of heat oven can handle / player can charge up to.
## UI value can go up to the 100 units.
@export_range(0.0, 120.0, 5.0) var oven_max_heat: float = 120.0
## Max amount of heat oven can handle / player can charge up to.
## UI value can go up to the 100 units.
@export_range(0.0, 120.0, 5.0) var oven_starting_heat: float = 105.0


## Wordle difficulty related variables.
@export_group("Wordle")
## Stores chance for wordle to appear on each hour.
## If 0 is not present, chance is set to 0.
@export var wordle_chance: Dictionary = {
	0: 0.0,
	1: 0.0,
	2: 0.1,
	3: 0.3,
	4: 0.4,
	5: 0.5,
}


## MusicBox difficulty related variables.
@export_group("MusicBox")

@export_subgroup("Winding")
## Units/sec how fast music box is WIND.
@export_range(0.0, 20.0, 0.1) var musicbox_wind_speed: float = 10.0
## Units/sec how fast music box is UNWIND.
@export_range(0.0, 10.0, 0.1) var musicbox_unwind_speed: float = 1.0
## Starting value of the music box.
@export_range(0.0, 150.0, 0.5) var musicbox_starting_value: float = 70.0

@export_subgroup("Thresholds")
@export_range(0.0, 150.0, 0.5) var musicbox_slowing_threshold: float = 25.0
## Units till music box is silent. Gameover may be caused now, but it is gurantee at 0.
@export_range(0.0, 150.0, 0.5) var musicbox_silent_threshold: float = 5.0
## Max units that music box can reach.
@export_range(0.0, 150.0, 0.5) var musicbox_max_threshold: float = 50.0


## WindowNBlind difficulty related variables.
@export_group("WindowNBlind")
## Hour at which enemy activates. Start from resting state.
@export_range(0, 5, 1) var window_start_hour: int = 1
## Min rest time between attacks.
@export_range(0.0, 100.0, 0.01) var window_min_rest_time: float = 3.0
## Max rest time between attacks.
@export_range(0.0, 100.0, 0.01) var window_max_rest_time: float = 6.0
## Time before kill / to defend.
@export_range(0.0, 100.0, 0.01) var window_attack_time: float = 10.0


## DoubleDoors difficulty related variables.
@export_group("DoubleDoors")
## Hour at which enemy activates. Start from resting state.
@export_range(0, 5, 1) var doors_start_hour: int = 4
## Min rest time between attacks.
@export_range(0.0, 100.0, 0.01) var doors_min_rest_time: float = 15.0
## Max rest time between attacks.
@export_range(0.0, 100.0, 0.01) var doors_max_rest_time: float = 20.0
## Time before kill / to defend.
@export_range(0.0, 100.0, 0.01) var doors_attack_time: float = 7.5
