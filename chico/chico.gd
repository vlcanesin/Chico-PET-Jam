extends CharacterBody2D

const SPEED = 200.0
var orientation: String = "right"
var has_actionable_collision: bool = false
var thought: String = ""

@onready var _walk_sprite = $WalkSprite
@onready var _thought_node = $Thought
@onready var _balloon_sprite = $Thought/Balloon
@onready var _content_sprite = $Thought/Content
@onready var actionable_finder: Area2D = $ActionableFinder

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _process(delta):
	_process_movement(delta)
	_process_thought()
		
func _process_movement(delta) -> void:
	if Input.is_action_pressed("ui_right"):
		orientation = "right"
		_walk_sprite.play("right")
		position.x += SPEED*delta
	elif Input.is_action_pressed("ui_left"):
		orientation = "left"
		_walk_sprite.play("left")
		position.x -= SPEED*delta
	else:
		_walk_sprite.stop()

func _process_thought() -> void:
	var actionables = actionable_finder.get_overlapping_areas()
	if actionables.size() > 0:
		thought = actionables[0].get_trigger_thought()
		has_actionable_collision = true
	else:
		has_actionable_collision = false
	
	if has_actionable_collision:
		if orientation == "right":
			_thought_node.position.x = 120
			_balloon_sprite.play("right")
			_play_thought_content()
		else:
			_thought_node.position.x = -120
			_balloon_sprite.play("left")
			_play_thought_content()
		_thought_node.visible = true
	else:
		_balloon_sprite.stop()
		_content_sprite.stop()
		_thought_node.visible = false

func _play_thought_content() -> void:
	match thought:
		"escutar":
			if orientation == "right":
				_content_sprite.position.x = 6
			else:
				_content_sprite.position.x = -6
			_content_sprite.play("escutar")
		_:
			assert(false)  # throws error
