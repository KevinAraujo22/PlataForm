extends StaticBody2D

var flip = true 
var posicao_inicial
var posicao_final
var velocidade = 5
var ataque = 20
var vida = 50
signal atualizar_vida(vida)

func _ready():
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 100
	
func _process(delta):
	if(posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$Sprite.flip_h = false
		if($".".position.x >= posicao_final):
			flip = false
	if($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$Sprite.flip_h = true
		if($".".position.x <= posicao_inicial):
			flip = true

	
func receberdano(ataque):
	vida = vida - ataque
	emit_signal("atualizar_vida", vida)
	if vida <= 0:
		vida = 0
	if vida == 0:
		queue_free()
	pass


func _on_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		body.receberdano(ataque)
		receberdano(ataque)
