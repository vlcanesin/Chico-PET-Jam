extends CharacterBody2D

const SLEEP_TIMEOUT: float = 10.0 

var default_height: int = 438  # OBS: não está como constante pois pode variar de cena pra cena
var orientation: String = "right"
var thought: String = ""
var is_sleeping: bool = true

@export var SPEED : float = 300.0

@onready var _walk_sprite = $WalkSprite
@onready var _thought_node = $Thought
@onready var _balloon_sprite = $Thought/Balloon
@onready var _content_sprite = $Thought/Content
@onready var actionable_finder: Area2D = $ActionableFinder
@onready var height_finder: Area2D = $HeightFinder
@onready var sleep_timer: Timer = $SleepTimer

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
	if Input.is_key_pressed(KEY_M):
		print("Mijar")
	if Input.is_key_pressed(KEY_L):
		print("Latir")

func _ready():
	sleep_timer.start(0)  # Começa dormindo

func _process(delta):
	if not DialogueGlobals.in_dialogue:
		_process_movement(delta)
		_process_height()
		_process_thought()
	else:
		_thought_node.visible = false
		_reset_timer()

func _reset_timer(time: float = SLEEP_TIMEOUT):
	sleep_timer.start(time)
	#print("Timer set to:", time)
	
func _process_movement(delta) -> void:
	if Input.is_action_pressed("ui_right"):
		is_sleeping = false
		_reset_timer()
		orientation = "right"
		_walk_sprite.flip_h = false
		_walk_sprite.play("right")
		position.x += SPEED*delta
	elif Input.is_action_pressed("ui_left"):
		is_sleeping = false
		_reset_timer()
		orientation = "left"
		_walk_sprite.flip_h = false
		_walk_sprite.play("left")
		position.x -= SPEED*delta
	elif not is_sleeping:
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
		if orientation == "right":
			_balloon_sprite.flip_h = false
			_balloon_sprite.play("right")
			_play_thought_content()
		else:
			_balloon_sprite.flip_h = true
			_balloon_sprite.play("right")
			_play_thought_content()
		_thought_node.visible = true
	else:
		_balloon_sprite.stop()
		_content_sprite.stop()
		_thought_node.visible = false

func _play_thought_content() -> void:
	if orientation == "right":
		_content_sprite.position.x = -10
	else:
		_content_sprite.position.x = 10
	_content_sprite.play(thought)

func _on_sleep_timer_timeout():
	is_sleeping = true
	if orientation == "left":
		_walk_sprite.flip_h = true
	else:
		_walk_sprite.flip_h = false
	_walk_sprite.play("sleep")
