extends HBoxContainer

var vida_atual = 100

func _ready():
	pass


func _on_Interface_atualizar_vida(vida):
	print("nada")
	animate_value(vida_atual,vida)
	vida_atual = vida
	$TextureProgress.value = vida
	pass # Replace with function body.

func animate_value(start,end):
	$Tween.interpolate_property($TextureProgress, "value", start, end, 0.3, Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	$Tween.start()