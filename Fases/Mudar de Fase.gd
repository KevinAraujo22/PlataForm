extends Area2D
var node
var scene
var body
func _ready():
	node = $".".get_parent()
	print(node)
	match node.name:
		"World":
			scene = "res://Fases/World2.tscn"
		"World2":
			scene = "res://Fases/World3.tscn"
		"World3":
			scene = "res://Fases/World4.tscn"
		"World4":
			scene = "res://Fases/World5.tscn"
		"World5":
			scene = "res://Fases/World5.tscn"
		
			
func _on_Mudar_de_Fase_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(scene)