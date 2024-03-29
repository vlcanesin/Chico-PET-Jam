extends CharacterBody2D

const SPEED = 200.0
var orientation: String = "right"
var has_actionable_collision: bool = false

@onready var _walk_sprite = $WalkSprite
@onready var _thought_sprite = $Thought
@onready var actionable_finder: Area2D = $ActionableFinder

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _process(delta):
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
		
	var actionables = actionable_finder.get_overlapping_areas()
	if actionables.size() > 0:
		has_actionable_collision = true
	else:
		has_actionable_collision = false
	
	if has_actionable_collision:
		if orientation == "right":
			_thought_sprite.offset.x = 350
			_thought_sprite.play("right")
		else:
			_thought_sprite.offset.x = -350
			_thought_sprite.play("left")
		_thought_sprite.visible = true
	else:
		_thought_sprite.stop()
		_thought_sprite.visible = false
