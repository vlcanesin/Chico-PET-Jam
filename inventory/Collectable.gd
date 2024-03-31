extends Area2D

func _on_tree_entered(item: InventoryItem):
	item.visible = false
