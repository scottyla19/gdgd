extends Node2D

@onready var exercise_list: OptionButton = $ExerciseList

func read_scenes_json(file_path) -> Dictionary:
	if not FileAccess.file_exists(file_path):
		print("JSON file not found at: ", file_path)
		return Dictionary()
	
	var file = FileAccess.open(file_path, FileAccess.READ)
	
	if file == null:
		print("Failed to open JSON file: ", FileAccess.get_open_error())
		return Dictionary()
	
	var json_string = file.get_as_text()
	file.close() # Close the file after reading
	
	var parsed_data = JSON.parse_string(json_string)
	if parsed_data == null:
		print("Failed to parse JSON string: ", json_string)
		return Dictionary()
		
	return parsed_data
	
func _ready() -> void:
	var exercise_data = read_scenes_json("res://data/scene_data.json")
	
	for item in exercise_data["scenes"]:
		exercise_list.add_item(item["name"])
		exercise_list.set_item_metadata(int(item["index"]), Dictionary({"path":item["path"],
		"name":item["name"]}))

func _process(delta: float) -> void:
	pass

func _on_exercise_open_pressed() -> void:
	var idx = exercise_list.get_selected_id()
	var metadata = exercise_list.get_item_metadata(idx)
	get_tree().change_scene_to_file(metadata["path"])
	
