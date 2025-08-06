extends Sprite2D

@onready var segment_count_option = $"../OptionButton"
const segment_map = [6, 12, 24, 45, 360]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if Input.is_key_pressed(KEY_1):
		material.set_shader_parameter("segment_count", segment_map[0])
	if Input.is_key_pressed(KEY_2):
		material.set_shader_parameter("segment_count", segment_map[1])
	if Input.is_key_pressed(KEY_3):
		material.set_shader_parameter("segment_count", segment_map[2])
	if Input.is_key_pressed(KEY_4):
		material.set_shader_parameter("segment_count", segment_map[3])
	if Input.is_key_pressed(KEY_5):
		material.set_shader_parameter("segment_count", segment_map[4])
		
	

func _on_option_button_item_selected(index: int) -> void:
	#material.set_shader_parameter("segment_count", index)
	material.set_shader_parameter("segment_count", int(segment_count_option.get_selected_id()))
