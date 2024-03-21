extends Node2D

var zoom: float = 1
var offset: Vector2

var init_mouse_pos: Vector2
var mouse_pos: Vector2

var holding: bool = false

func _physics_process(delta):
	$ColorRect.get_material().set_shader_parameter("zoom",zoom)
	$ColorRect.get_material().set_shader_parameter("offset",offset)
	
	if holding:
		offset += (init_mouse_pos-mouse_pos) * 0.005 * zoom
		init_mouse_pos = get_viewport().get_mouse_position()

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP && zoom > 0:
				zoom -= 0.1 * zoom
			elif  event.button_index == MOUSE_BUTTON_WHEEL_DOWN && zoom > 0:
				zoom += 0.1 * zoom
			elif zoom <= 0:
				zoom = 0.1
				
			if event.button_index == MOUSE_BUTTON_MIDDLE:
				holding = true
				init_mouse_pos = event.position
			
		elif !event.is_pressed():
			if event.button_index == MOUSE_BUTTON_MIDDLE:
				holding = false
	if event is InputEventMouseMotion:
		mouse_pos = event.position
