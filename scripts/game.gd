extends Node2D

var sound_door_open = preload("res://audio/yodguard-door-opening-slowly-1-535465.mp3")
var sound_collect = preload("res://audio/638390__ulrich_wehner__horror-stinger-13_killing-machine.wav")
var sound_clean_pond = preload("res://audio/freesound_community-water-splash-46402.mp3")
var sound_book_close = preload("res://audio/oxidvideos-book-closing-466850.mp3")
var sound_book_open = preload("res://audio/paper_turn.mp3")
var sound_candle = preload("res://assets/youssefmizani-flame-lighting-a-fire-in-the-oven-510618.mp3")
var sound_push_wood = preload("res://assets/floraphonic-beer-can-table-foley-slide-10-238336.mp3")
var sound_jump = preload("res://assets/dragon-studio-simple-whoosh-382724.mp3")
var sound_frame = preload("res://assets/freesound_community-menu-change-89197.mp3")

var sound_glass_break = preload("res://assets/universfield-glass-bottle-smash-277554.mp3")
var sound_iseeyou = preload("res://assets/dragon-studio-i-see-you-creepy-ghost-whisper-401711.mp3")
var sound_low_growl = preload("res://assets/gsmsea-megalodon-low-growl-432984.mp3")
var sound_thud = preload("res://assets/edr-electronic-impact-soft-10019.mp3")
var sound_stone = preload("res://assets/freesound_community-tomb-door-open-stone-scrape-102748.mp3")



@onready var walking_sound = $sfx/walking_sound

func play_sound(sound, vol = 0.0):
	var temp = AudioStreamPlayer.new()
	temp.stream = sound
	temp.volume_db = vol
	add_child(temp)
	
	temp.finished.connect(temp.queue_free)
	temp.play()


func init_game():
	init_lights()
	init_shine()
	init_sounds()

func init_shine():
	shine($r18/collect/num)
	shine($canvas/nums/num1/num1)

func init_lights():
	$r18/lights.visible = 1
	$r17/lights.visible = 1
	$r16/lights.visible = 1
	$r15/lights.visible = 1
	$r14/lights.visible = 1
	$r13/lights.visible = 1
	
	$player/flash.visible = 1
	$hallway/lights.visible = 1

func init_sounds():
	await get_tree().create_timer(15).timeout
	play_sound(sound_glass_break)
	

func _ready() -> void:
	#play_sound(sound_collect)
	init_game()
	
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
	if $player.walk && $player.move:
		#print($player.walk)
		if !walking_sound.playing:
			walking_sound.play()
			#print("um?a")
		if $player.sprint:
			walking_sound.pitch_scale = 2.0
		else:
			walking_sound.pitch_scale = 1
	else:
		walking_sound.stop()
	
	#if $player.jumping:
	
	if Input.is_action_just_pressed("interact"):
		if main_room_door_1:
			play_sound(sound_door_open)
			$player.position = Vector2(-177.0, 74)
		elif main_room_door_2:
			play_sound(sound_door_open)
			$player.position = Vector2(-169.0, 821.0)
		
		if r17_door_down:
			play_sound(sound_door_open)
			$player.position = Vector2(-1504.0, 74)
		elif r17_door_up:
			play_sound(sound_door_open)
			$player.position = Vector2(-1113.0, 821.0)
		
		if r16_door_down:
			play_sound(sound_door_open)
			$player.position = Vector2(-2834.0, 74)
		elif r16_door_up:
			play_sound(sound_door_open)
			$player.position = Vector2(-2103.0, 821)
		
		if r15_door_down:
			play_sound(sound_door_open)
			$player.position = Vector2(-4132.0, 74)
		elif r15_door_up:
			play_sound(sound_door_open)
			$player.position = Vector2(-3095.0, 821)
		
		if r14_door_down:
			play_sound(sound_door_open)
			$player.position = Vector2(-5461.0, 74)
		elif r14_door_up:
			play_sound(sound_door_open)
			$player.position = Vector2(-4037.0, 821)
		
		if r13_door_down:
			play_sound(sound_door_open)
			$player.position = Vector2(-6838.0, 74)
		elif r13_door_up:
			play_sound(sound_door_open)
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
		if $r14/room/desk.position.x == 0:
			print("pushed")
			play_sound(sound_push_wood)
			var tween = create_tween()
			tween.tween_property($r14/room/desk, "position:x", 30, 1)
			await get_tree().create_timer(1.0).timeout
			$r14/room/collect/num2/CollisionShape2D.set_deferred("disabled", 0)

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

var style = StyleBoxFlat.new()

func shine(node) -> void:
	
	var style = node.get_theme_stylebox("panel")
	style = StyleBoxFlat.new()
	node.add_theme_stylebox_override("panel", style)

	style.bg_color = Color(1, 1, 1, 1)
	style.corner_radius_top_left = 10
	style.corner_radius_top_right = 10
	style.corner_radius_bottom_left = 10
	style.corner_radius_bottom_right = 10

	var tween = create_tween().set_loops()
	tween.tween_property(style, "bg_color", Color(1.7, 1.7, 1.1, 1.0), 1.3)
	tween.tween_property(style, "bg_color", Color(1.0, 1.0, 1.0, 1.0), 0.7)


func _on_num_1_body_entered(body: Node2D) -> void:
	if body == $player:
		collect_num($r18/collect/num, "I")

func collect_num(node1, tex):
	#play_sound()
	if !node1.visible: return
	node1.visible = 0
	play_sound(sound_collect)
	var node2 = $canvas/nums/num1
	#node.scale = Vector2(2, 2)
	#node2.position.x -= 300
	node2.get_node('num1').get_node('Label').text = tex
	#node2.visible = 1
	node2.modulate.a = 0
	var tween = create_tween()
	#$canvas/nums
	#await tween.tween_property(node2, "position:x", node2.position.x +300, 1)
	#await tween.tween_property(node2, "position:x", node2.position.x +300, 1)
	
	tween.tween_property(node2, "modulate:a", 1.0, 0.4)
	await get_tree().create_timer(1).timeout
	
	var tween2 = create_tween()
	tween2.tween_property(node2, "modulate:a", 0.0, 0.2)
	
	await get_tree().create_timer(1).timeout
	await get_tree().create_timer(1).timeout
	node2.visible = 0
	$hallway/map/clock.get_node(tex).visible = 1

func _on_num_2_body_entered(body: Node2D) -> void:
	if body == $player:
		collect_num($r18/collect/num, "X")

func _on_num_r14_body_entered(body: Node2D) -> void:
	if body == $player:
		print('r14_coin')
		collect_num($r14/room/collect/num, "IV")


func _on_mob_mouse_entered() -> void:
	$r15/room/mob/outline.visible = 1
func _on_mob_mouse_exited() -> void:
	$r15/room/mob/outline.visible = 0
	
var mob_equipped = 1
var lighter_equipped = 1

func _on_mob_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		$r15/room/mob.visible = 0
		mob_equipped = 1
		print("mob taken")

func _on_pond_clean_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if mob_equipped:
			if $r17/room/pond2.visible:
				$r17/room/pond2.visible = 0
				$r17/boundaries/walls/pond_clear.set_deferred("disabled", 0)
				$r17/room/pond_area/CollisionShape2D.set_deferred("disabled", 1)
				play_sound(sound_clean_pond)

func _on_lighter_area_mouse_entered() -> void:
	$r18/room/lighter/outline.visible = 1
func _on_lighter_area_mouse_exited() -> void:
	$r18/room/lighter/outline.visible = 0
func _on_lighter_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		$r18/room/lighter.visible = 0
		lighter_equipped = 1
func _on_candle_r16_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if lighter_equipped:
			if !$r16/room/candle.visible:
				play_sound(sound_candle)
				$r16/room/candle.visible = 1
func _on_candle_r15_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if lighter_equipped:
			if !$r15/room/candle.visible:
				play_sound(sound_iseeyou)
				play_sound(sound_candle)
				$r15/room/collect.visible = 1
				$r15/room/candle.visible = 1
				$r15/room/collect/num15/CollisionShape2D.set_deferred("disabled", 0)
func _on_num_r15_body_entered(body: Node2D) -> void:
	if body == $player:
		print('r15_coin')
		collect_num($r15/room/collect/num, "V")

func _on_candle_r13_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if lighter_equipped:
			if !$r13/room/candle.visible:
				play_sound(sound_candle)
				$r13/room/candle.visible = 1

func _on_book_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print('book opened')
		play_sound(sound_book_open)
		$canvas/book.visible = 1
func _on_book_coin_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print('special opened')
		play_sound(sound_book_open)
		if $canvas/book/collect/num.visible:
			$canvas/book.visible = 1
			$canvas/book/close.visible = 0
			$canvas/book/Label.visible = 0
			$canvas/book/collect/num/Label.visible = 1
			$canvas/book/collect.visible = 1
			await get_tree().create_timer(2).timeout
			collect_num($canvas/book/collect/num, "VI")
			await get_tree().create_timer(2).timeout
			$canvas/book/close.visible = 1
			$canvas/book/Label.visible = 1
		
func _on_close_book_pressed() -> void:
	play_sound(sound_book_close)
	$canvas/book.visible = 0

func painting_rotate(paint):
	if paint.rotation != 12.9:
		paint.rotation = 12.9
		play_sound(sound_frame)

func _on_painting_r15_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		painting_rotate($r15/room/paint/paint)
func _on_painting_r14_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		painting_rotate($r14/room/paint/paint)
func _on_painting_r13_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		painting_rotate($r13/room/paint/paint)
		$r13/room/collect/num2/CollisionShape2D.set_deferred("disabled", 0)
		await get_tree().create_timer(1.0).timeout
		collect_num($r13/room/collect/num, "XI")

func _on_hallway_right_body_entered(body: Node2D) -> void:
	if body == $player:
		$player.position.x = -5854.0
func _on_hallway_left_body_entered(body: Node2D) -> void:
	if body == $player:
		$player.position.x = 1438.0
