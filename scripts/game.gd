extends Node2D


func init_game():
	init_lights()

func init_lights():
	$room_1/map_behind/lights.visible = 1
	$player/flash.visible = 1
	
func _ready() -> void:
	init_game()



func _process(delta: float) -> void:
	pass
