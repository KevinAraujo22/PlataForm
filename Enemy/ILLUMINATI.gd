extends StaticBody2D

const UP = Vector2(0,-1)
var motion = Vector2()
var vida = 300
onready var player = get_node("../Player")
var run = false
var ataque = 50
var dash_speed = Vector2(300,0)
var dash_time = 0.2
var can_dash = true

signal atualizar_vida(vida)

func _on_Player_Vivo():
	var direction = ((player.position - position).normalized())*4
	var distance = player.position - position
	if (distance.x >= -800 and distance.x <= 0) or (distance.x <= 800 and distance.x >= 0):
		position.x = (direction.x + position.x)
	if distance.x > 0:
		$Sprite.flip_h = false
	if distance.x < 0:
		$Sprite.flip_h = true
		pass 
	pass 


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.receberdano(ataque)
		receberdano(ataque)
		can_dash = false
		$dash.start()
		if position > body.position:
			dash_speed.x = abs(dash_speed.x)
		else:
			dash_speed.x = -1*abs(dash_speed.x)
		dash()
	pass 
	
func receberdano(ataque):
	vida = vida - ataque
	emit_signal("atualizar_vida", vida)
	if vida <= 0:
		vida = 0
	if vida == 0:
		queue_free()
		get_tree().change_scene("res://WinGame/WinGame.tscn")
	pass

func dash():
	$Tween.interpolate_property(self,'position',position,position + dash_speed,dash_time,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()


func _on_dash_timeout():
	can_dash = true
	pass # Replace with function body.
