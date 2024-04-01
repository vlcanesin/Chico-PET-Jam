extends Area2D

func _on_item_body_entered(body):
	queue_free()
