extends Node

var unlock_calc_study: bool = false
var unlock_calc_pencil: bool = false
var unlock_water: bool = false
var unlock_tri: bool = false

var calc_study_completed: bool = false
var calc_pencil_completed: bool = false

var enable_collision_actionables: bool = true

var chico_start_position: Vector2 = Vector2(4303, 435)
var chico_speed: float = 1000.0
var chico_already_seen_sagui: bool = false
var chico_already_ALGOAQUI: bool = false
var chico_position: Vector2 = Vector2()
var chico_found_caramelo: bool = false

var enable_follow_at_bark: bool = false
var dogfight_is_running: bool = false
