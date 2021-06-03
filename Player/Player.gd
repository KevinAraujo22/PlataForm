extends KinematicBody2D
signal Vivo()
const UP = Vector2(0 , -1)
const GRAVITY = 20
const SPEED = 250
const JUMP_HEIGHT = -560

var motion = Vector2()
var vida = 200
var ataque = 20

#tirinho que o Luan fez
export (PackedScene) var bala
var can_shoot = true

signal atualizar_vida(vida)

func _physics_process(delta):
	emit_signal("Vivo")
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.rotation_degrees += 5
	elif Input.is_action_pressed("ui_left"):
		motion.x= -SPEED
		$Sprite.rotation_degrees -= 5
	else:
		motion.x = 0
	if is_on_floor() :
		if Input.is_action_pressed("ui_up"):
			$AudioStreamPlayer2D.play()
			motion.y = JUMP_HEIGHT
	if Input.is_action_pressed("click"):
		if can_shoot:
			shoot(get_global_mouse_position())
	motion = move_and_slide(motion, UP)
	
		

		
		
func receberdano(ataque):
	print                              ("daninho")
	vida = vida - ataque
	emit_signal("atualizar_vida", vida)
	if vida <= 0:
		vida = 0
	if vida == 0:
		get_tree().change_scene("res://Fases/GameOver/GameOver.tscn")
	if vida > 100:
		vida = 100
	
func _on_hitbox_body_entered(body):
	if body.is_in_group("ENEMIGOS"):
		body.receberdano(ataque)
		
func shoot(pos):
	if not get_parent().name == "World5":
		return
	var a = (pos - global_position).angle()
	can_shoot = false
	$Timer.start()
	var b = bala.instance()
	b.start(global_position, a + rand_range(-0.05, 0.05))
	get_parent().add_child(b)

func _on_Timer_timeout():
	can_shoot = true
