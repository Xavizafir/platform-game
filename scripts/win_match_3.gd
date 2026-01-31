extends Control

@export var next_scene: String = "res://Scenes/game_platform_2.tscn"
@onready var fade_rect: ColorRect = $FadeRect

var is_transitioning := false

func _ready():
	fade_rect.visible = true
	fade_rect.modulate.a = 0.0

func _input(event):
	if is_transitioning:
		return

	if (event is InputEventMouseButton and event.pressed) \
	or (event is InputEventScreenTouch and event.pressed):
		is_transitioning = true
		await fade_out()
		get_tree().change_scene_to_file(next_scene)

func fade_out() -> void:
	var tween := create_tween()
	tween.tween_property(
		fade_rect,
		"modulate:a",
		1.0,
		0.6
	)
	await tween.finished
