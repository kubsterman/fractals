extends Node2D

var zoom: float
var offset: Vector2

var init_mouse_pos: Vector2
var final_mouse_pos: Vector2

var holding: bool = false

func _physics_process(delta):
	$ColorRect.get_material().set_shader_parameter("zoom",zoom)
	$ColorRect.get_material().set_shader_parameter("offset",offset)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom += 1
			elif  event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom -= 1
				
			if event.button_index == MOUSE_BUTTON_MIDDLE:
				holding = true
				init_mouse_pos = event.position
				
		elif !event.is_pressed():
			if event.button_index == MOUSE_BUTTON_MIDDLE:
				holding = false
				
