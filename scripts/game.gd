extends Node2D


func init_game():
	init_lights()

func init_lights():
	$room_1/map_behind/lights.visible = 1
	$room_2/map_behind/lights.visible = 1
	$room_3/map_behind/lights.visible = 1
	
	
	$player/flash.visible = 1
	$hallway/lights.visible = 1
	
func _ready() -> void:
	init_game()

var main_room_door_1 = 0
var main_room_door_2 = 0
var room_1_door_1 = 0
var room_1_door_2 = 0

func _on_main_room_door_1_body_entered(body: Node2D) -> void:
	if body == $player:
		main_room_door_1 = 1
func _on_main_room_door_1_body_exited(body: Node2D) -> void:
	if body == $player:
		main_room_door_1 = 0
func _on_main_room_door_2_body_entered(body: Node2D) -> void:
	if body == $player:
		main_room_door_2 = 1
func _on_main_room_door_2_body_exited(body: Node2D) -> void:
	if body == $player:
		main_room_door_2 = 0


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if main_room_door_1:
			$player.position = Vector2(-177.0, 74)
		elif main_room_door_2:
			$player.position = Vector2(-169.0, 821.0)
		
		if room_1_door_1:
			$player.position = Vector2(1135.0, 74)
		elif room_1_door_2:
			$player.position = Vector2(820.0, 821.0)
		

func _on_room_1_door_1_body_entered(body: Node2D) -> void:
	if body == $player:
		room_1_door_1 = 1
func _on_room_1_door_1_body_exited(body: Node2D) -> void:
	if body == $player:
		room_1_door_1 = 0
func _on_room_1_door_2_body_entered(body: Node2D) -> void:
	if body == $player:
		room_1_door_2 = 1
func _on_room_1_door_2_body_exited(body: Node2D) -> void:
	if body == $player:
		room_1_door_2 = 0


func _on_pond_area_body_entered(body: Node2D) -> void:
	if body == $player:
		body.def_speed = 150
		body.def_sprint = 250
		body.def_jump = -150
		body.def_sprint_jump = -200
func _on_pond_area_body_exited(body: Node2D) -> void:
	if body == $player:
		body.def_speed = 300
		body.def_sprint = 400
		body.def_jump = -350.0
		body.def_sprint_jump = -400
		
