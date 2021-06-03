extends Area2D

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.dano()
		get_tree().change_scene("res://Fases/GameOver.tscn")