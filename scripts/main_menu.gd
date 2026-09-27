extends Node2D

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

var code = ""
var deciphered = ""
var day = ""
var month = ""
var year = ""

func decipher():
	deciphered = ""
	
	print(code[0], " rooms")
	#code.remove_char(0)
	#code.erase(0,2)
	var temp = 1
	
	day += char(code[temp].unicode_at(0)-30)
	temp += 1
	if code[temp] != "2":
		day += char(code[temp].unicode_at(0)-30)
		temp += 1
	if code[temp] == "2":
		temp += 1
	
	month += char(code[temp].unicode_at(0)-40)
	temp += 1
	if code[temp] != "6":
		month += char(code[temp].unicode_at(0)-40)
		temp += 1
	if code[temp] == "6":
		temp += 1
	
	year += char(code[temp].unicode_at(0)-50)
	temp += 1
	year += char(code[temp].unicode_at(0)-50)
	temp += 1
	year += char(code[temp].unicode_at(0)-50)
	temp += 1
	year += char(code[temp].unicode_at(0)-50)
	temp += 1
	
	print(day)
	print(month)
	print(year)
	global.day = int(day)
	global.month = int(month)
	global.year = int(year)
	global.rooms = int(code[0])
	
	#
	#for i in range(1, code.length()):
		#
		#if code[i] == "0":
			#print(i)
			#temp += i
			#break
	print("temp ", temp)
	#
	
	for i in range(temp, code.length()):
		if !i % 2: 
			deciphered += char(code[i].unicode_at(0)-1)

func _on_submit_pressed() -> void:
	code = $code/code.text
	decipher()
	print(deciphered)
	global.him = deciphered
	$code.visible = 0
	$submit.visible = 0
	$paste.visible = 0
	$play.visible = 1
	$"R-19".visible = 1
	$play/play.disabled = 0
	
func _on_paste_pressed() -> void:
	print(DisplayServer.clipboard_get())
	$code/code.text = DisplayServer.clipboard_get()
