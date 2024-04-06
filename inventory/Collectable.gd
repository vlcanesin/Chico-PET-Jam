extends Area2D

@export var itemRes: InventoryItem

func _process(_delta):
	if itemRes.name == "Lapis":
		if LogicGlobals.unlock_calc_pencil:
			self.position.y = 520

func collect(inventory: Inventory):
	inventory.insert(itemRes)
	queue_free()
