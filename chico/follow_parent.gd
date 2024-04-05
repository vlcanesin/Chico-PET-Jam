extends Node2D

@onready var sprites = $Sprites
@onready var height_finder = $HeightFinder

@export var node_to_follow: Node

var SPEED = 300.0
const DIST = 200

var default_height
var follow_parent: bool = false

func _ready():
	default_height = position.y

func _process(delta):
	if LogicGlobals.dogfight_is_running:
		queue_free()
	_update_speed()
	_process_height()
	if LogicGlobals.enable_follow_at_bark:
		if node_to_follow.position.x > position.x + DIST and follow_parent:
			sprites.flip_h = false
			position.x += SPEED*delta
			sprites.play("walk")
		elif node_to_follow.position.x < position.x - DIST and follow_parent:
			sprites.flip_h = true
			position.x -= SPEED*delta
			sprites.play("walk")
		else:
			sprites.stop()
	
func _process_height():
	var height_actionables = height_finder.get_overlapping_areas()
	if height_actionables.size() > 0:
		position.y = default_height + height_actionables[0].get_height()
	
func set_node_to_follow(node: Node):
	node_to_follow = node
	position.y = node_to_follow.position.y
	position.x = node_to_follow.position.x-DIST
	default_height = position.y
	print(node_to_follow.position, position)
	
func _update_speed():
	SPEED = LogicGlobals.chico_speed

func _on_bark_actionable_heard_bark():
	LogicGlobals.chico_found_caramelo = true
	follow_parent = true
	position.y = node_to_follow.position.y
	position.x = node_to_follow.position.x-DIST
	default_height = position.y
