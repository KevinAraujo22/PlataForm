extends Node2D

var flushou
var f1

func _ready():
	$AudioStreamPlayer.play()
	flushou = false
	f1 = 1
	pass

func _on_TextEdit_cursor_changed():
	print("cursor mudou")
	print(f1)
	if flushou == false and f1 == 0:
		$Sprite/TextEdit.text = " "
		flushou = true
	f1 -= 1
	pass 

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"Sugestion" : $"/WinGame/Sprite/TextEdit".text
	}
	return save_dict

func save_game():
	var save_game = File.new()
	save_game.open("res://sugestion.json", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("a")
	for i in save_nodes:
		var node_data = i.text;
		save_game.store_line(to_json(node_data))
	save_game.close()

func _on_Button_pressed():
	save_game()
	pass 

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.stop()
	print("acabou")
	pass


func _on_Timer_timeout():
	$AudioStreamPlayer.queue_free()
	pass # Replace with function body.
