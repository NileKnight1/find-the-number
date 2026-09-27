extends Node2D

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

var code = ""
var deciphered = ""

func decipher():
	deciphered = ""
	for i in code.length():
		if !i % 2: 
			deciphered += char(code[i].unicode_at(0)-1)

func _on_submit_pressed() -> void:
	code = $code/code.text
	decipher()
	print(deciphered)
	$code.visible = 0
	$submit.visible = 0
	$paste.visible = 0
	$play.visible = 1
	$"R-19".visible = 1
	$play/play.disabled = 0
	
func _on_paste_pressed() -> void:
	print(DisplayServer.clipboard_get())
	$code/code.text = DisplayServer.clipboard_get()
