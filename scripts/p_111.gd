extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	var mouse_pos = get_viewport().get_mouse_position()
	var window_size: Vector2 = Vector2(get_viewport().size)
	var mouse_percent = mouse_pos / window_size
	var mousePos = mouse_percent
	
	mousePos.x = clampf(mouse_percent.x, 0.1, 0.9)
	mousePos.y = clampf(mouse_percent.y, 0.05, 0.95)
	
	material.set_shader_parameter("mouse_x", mousePos.x)
	material.set_shader_parameter("mouse_y", mousePos.y)
	
	
