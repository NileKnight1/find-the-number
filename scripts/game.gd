extends Node2D


func init_game():
	init_lights()

func init_lights():
	$main_room/map_behind/lights.visible = 1
	$room_1/map_behind/lights.visible = 1
	$room_2/map_behind/lights.visible = 1
	$room_3/map_behind/lights.visible = 1
	$room_4/map_behind/lights.visible = 1
	$room_5/map_behind/lights.visible = 1
	
	
	
	
	$player/flash.visible = 1
	$hallway/lights.visible = 1
	
func _ready() -> void:
	#init_game()
	
	pass

var main_room_door_1 = 0
var main_room_door_2 = 0


func _on_main_room_door_1_body_entered(body: Node2D) -> void:
	if body == $player:
		main_room_door_1 = 1
		print(main_room_door_1)
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
	#print($player.position)
	if Input.is_action_just_pressed("interact"):
		if main_room_door_1:
			$player.position = Vector2(-177.0, 74)
		elif main_room_door_2:
			$player.position = Vector2(-169.0, 821.0)
		
		if r17_door_down:
			$player.position = Vector2(-1504.0, 74)
		elif r17_door_up:
			$player.position = Vector2(-1113.0, 821.0)
		
		if r16_door_down:
			$player.position = Vector2(-2834.0, 74)
		elif r16_door_up:
			$player.position = Vector2(-2103.0, 821)
		
		if r15_door_down:
			$player.position = Vector2(-4132.0, 74)
		elif r15_door_up:
			$player.position = Vector2(-3095.0, 821)
		
		if r14_door_down:
			$player.position = Vector2(-5461.0, 74)
		elif r14_door_up:
			$player.position = Vector2(-4037.0, 821)
		
		if r13_door_down:
			$player.position = Vector2(-6838.0, 74)
		elif r13_door_up:
			$player.position = Vector2(-5024.0, 821)
		


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
		
func _on_desk_push_body_entered(body: Node2D) -> void:
	if body == $player:
		var tween = create_tween()
		tween.tween_property($room_6/map_behind/room/desk, "position:x", 30, 1)

var r17_door_down = 0
var r17_door_up = 0
var r16_door_down = 0
var r16_door_up = 0
var r15_door_down = 0
var r15_door_up = 0
var r14_door_down = 0
var r14_door_up = 0
var r13_door_down = 0
var r13_door_up = 0

func _on_r17_door_down_body_entered(body: Node2D) -> void:
	if body == $player:
		r17_door_down = 1
		print("r17_door_down",r17_door_down)
func _onr17_door_down_body_exited(body: Node2D) -> void:
	if body == $player:
		r17_door_down = 0
		print("r17_door_down",r17_door_down)
func _on_r17_door_up_body_entered(body: Node2D) -> void:
	if body == $player:
		r17_door_up = 1
		print("r17_door_up",r17_door_up)
func _on_r17_door_up_body_exited(body: Node2D) -> void:
	if body == $player:
		r17_door_up = 0
		print("r17_door_up",r17_door_up)

func _on_r16_door_down_body_entered(body: Node2D) -> void:
	if body == $player:
		r16_door_down = 1
		print("r16_door_down",r16_door_down)
func _on_r16_door_down_body_exited(body: Node2D) -> void:
	if body == $player:
		r16_door_down = 0
		print("r16_door_down",r16_door_down)
func _on_r16_door_up_body_entered(body: Node2D) -> void:
	if body == $player:
		r16_door_up = 1
		print("r16_door_up",r16_door_up)
func _on_r16_door_up_body_exited(body: Node2D) -> void:
	if body == $player:
		r16_door_up = 0
		print("r16_door_up",r16_door_up)


func _on_r15_door_down_body_entered(body: Node2D) -> void:
	if body == $player:
		r15_door_down = 1
		print("r15_door_down",r15_door_down)
func _on_r15_door_down_body_exited(body: Node2D) -> void:
	if body == $player:
		r15_door_down = 0
		print("r15_door_down",r15_door_down)
func _on_r15_door_up_body_entered(body: Node2D) -> void:
	if body == $player:
		r15_door_up = 1
		print("r15_door_up",r15_door_up)
func _on_r15_door_up_body_exited(body: Node2D) -> void:
	if body == $player:
		r15_door_up = 0
		print("r15_door_up",r15_door_up)

func _on_r14_door_down_body_entered(body: Node2D) -> void:
	if body == $player:
		r14_door_down = 1
		print("r14_door_down",r14_door_down)
func _on_r14_door_down_body_exited(body: Node2D) -> void:
	if body == $player:
		r14_door_down = 0
		print("r14_door_down",r14_door_down)
func _on_r14_door_up_body_entered(body: Node2D) -> void:
	if body == $player:
		r14_door_up = 1
		print("r14_door_up",r14_door_up)
func _on_r14_door_up_body_exited(body: Node2D) -> void:
	if body == $player:
		r14_door_up = 0
		print("r14_door_up",r14_door_up)

func _on_r13_door_down_body_entered(body: Node2D) -> void:
	if body == $player:
		r13_door_down = 1
		print("r13_door_down",r13_door_down)
func _on_r13_door_down_body_exited(body: Node2D) -> void:
	if body == $player:
		r13_door_down = 0
		print("r13_door_down",r13_door_down)
func _on_r13_door_up_body_entered(body: Node2D) -> void:
	if body == $player:
		r13_door_up = 1
		print("r13_door_up",r13_door_up)
func _on_r13_door_up_body_exited(body: Node2D) -> void:
	if body == $player:
		r13_door_up = 0
		print("r13_door_up",r13_door_up)
