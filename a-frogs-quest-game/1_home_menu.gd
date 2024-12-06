extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button__start_pressed() -> void:
	print("start pressed")
	get_tree().change_scene_to_file("res://Scenes/2-Level1.tscn")

func _on_button__instructions_pressed() -> void:
	print("instructions pressed")
	get_tree().change_scene_to_file("res://Scenes/1.5-Instructions.tscn")

func _on_button_exit_pressed() -> void:
	print("exit pressed")
	get_tree().quit()
