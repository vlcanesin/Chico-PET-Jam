extends CharacterBody2D

const SLEEP_TIMEOUT: float = 10.0 
const MIJO_LENGTH: float = 8.0/12
const BARK_LENGTH: float = 4.0/8

const METATHOUGHT_SCALE: float = 0.3

var default_height: int = 438  # OBS: não está como constante pois pode variar de cena pra cena
var orientation: String = "right"
var thought: String = ""
var is_sleeping: bool = true
var is_MIJANDO: bool = false
var is_barking: bool = false

@export var SPEED : float = 300.0

@export var inventory: Inventory

@onready var _walk_sprite = $WalkSprite
@onready var _bark_bark = $BarkBark
@onready var _thought_node = $Thought
@onready var _balloon_sprite = $Thought/Balloon
@onready var _content_sprite = $Thought/Content
@onready var actionable_finder: Area2D = $ActionableFinder
@onready var height_finder: Area2D = $HeightFinder
@onready var sleep_timer: Timer = $SleepTimer
@onready var MIJO_timer: Timer = $MIJOTimer
@onready var bark_timer: Timer = $BarkTimer
@onready var bark_sound = $BarkSound
@onready var MIJO_sound = $MIJOSound

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
	if Input.is_key_pressed(KEY_M) and not is_sleeping and MIJO_timer.time_left <= 0.01:
		MIJO_sound.play()
		is_sleeping = false
		is_MIJANDO = true
		_fix_orientation()
		_walk_sprite.play("MIJAR")
		_reset_MIJO_timer()
	if Input.is_key_pressed(KEY_L) and not is_sleeping and bark_timer.time_left <= 0.01:
		bark_sound.play()
		is_sleeping = false
		is_barking = true
		_bark_bark.visible = true
		_bark_bark.play("default")
		_reset_bark_timer()

func _ready():
	is_sleeping = true
	sleep_timer.start(0)  # Começa dormindo
	_walk_sprite.play("sleep")
	_bark_bark.visible = false
	_thought_node.visible = false

func _process(delta):
	if not DialogueGlobals.in_dialogue:
		_process_movement(delta)
		_process_height()
		if not is_sleeping:
			_process_thought()
		else:
			_thought_node.visible = false
	else:
		_thought_node.visible = false
		_reset_sleep_timer()

func _reset_MIJO_timer(time: float = MIJO_LENGTH):
	MIJO_timer.start(time)

func _reset_bark_timer(time: float = BARK_LENGTH):
	bark_timer.start(time)

func _reset_sleep_timer(time: float = SLEEP_TIMEOUT):
	sleep_timer.start(time)
	#print("Timer set to:", time)
	
func _fix_orientation():
	if orientation == "left":
		_walk_sprite.flip_h = true
	else:
		_walk_sprite.flip_h = false

func _fix_bark_position():
	if orientation == "left":
		_bark_bark.flip_h = true
		_bark_bark.position.x = -86
	else:
		_bark_bark.flip_h = false
		_bark_bark.position.x = 86

func _process_movement(delta) -> void:
	move_and_slide()  # garante processamento da colisão
	if Input.is_action_pressed("ui_right") and not is_MIJANDO:
		is_sleeping = false
		_reset_sleep_timer()
		orientation = "right"
		_fix_orientation()
		_fix_bark_position()
		_walk_sprite.play("right")
		position.x += SPEED*delta
	elif Input.is_action_pressed("ui_left") and not is_MIJANDO:
		is_sleeping = false
		_reset_sleep_timer()
		orientation = "left"
		_fix_orientation()
		_fix_bark_position()
		_walk_sprite.play("right")
		position.x -= SPEED*delta
	elif not is_sleeping and not is_MIJANDO:
		_walk_sprite.stop()

func _process_height():
	var height_actionables = height_finder.get_overlapping_areas()
	if height_actionables.size() > 0:
		position.y = default_height + height_actionables[0].get_height()

func _process_thought() -> void:
	var actionables = actionable_finder.get_overlapping_areas()
	var has_actionable_collision: bool = false
	if actionables.size() > 0:
		thought = actionables[0].get_trigger_thought()
		has_actionable_collision = true
	else:
		has_actionable_collision = false
	
	if has_actionable_collision:
		_thought_node.visible = true
		if orientation == "right":
			_balloon_sprite.flip_h = false
			_balloon_sprite.play("right")
			_play_thought_content()
		else:
			_balloon_sprite.flip_h = true
			_balloon_sprite.play("right")
			_play_thought_content()
	else:
		_thought_node.visible = false
		_balloon_sprite.stop()
		_content_sprite.stop()

func _play_thought_content() -> void:
	if orientation == "right":
		_content_sprite.position.x = -10
	else:
		_content_sprite.position.x = 10
	if thought == "pensar":
		_content_sprite.scale.x = 0.3
		_content_sprite.scale.y = 0.3
	else:
		_content_sprite.scale.x = 0.45
		_content_sprite.scale.y = 0.45
	_content_sprite.play(thought)

func _on_sleep_timer_timeout():
	is_sleeping = true
	_fix_orientation()
	_walk_sprite.play("sleep")

func _on_MIJO_timer_timeout():
	MIJO_timer.stop()
	_walk_sprite.stop()
	is_MIJANDO = false

func _on_bark_timer_timeout():
	_bark_bark.visible = false
	bark_timer.stop()
	_bark_bark.stop()
	is_barking = false

func _on_hitbox_area_entered(area):
	if area.has_method("collect"):
		area.collect(inventory)
