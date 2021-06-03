extends Area2D
signal atualizar_vida
func _on_Heart_body_entered(body):
	if body.is_in_group("Player"):
		$"../Player".receberdano(-100)
		print("hh")
		queue_free()
	pass 
	
