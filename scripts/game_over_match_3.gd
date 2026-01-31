extends Control

@export var retry_scene := "res://Scenes/Game_match3.tscn"
@export var back_scene := "res://Scenes/game_platform.tscn"
	



func _on_yes_button_pressed() -> void:
	get_tree().change_scene_to_file(retry_scene)


func _on_no_button_pressed() -> void:
	get_tree().change_scene_to_file(back_scene)
