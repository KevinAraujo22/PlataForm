extends Area2D

func _on_Spinho_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://Fases/GameOver/GameOver.tscn")
	pass 