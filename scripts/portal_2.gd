extends Area2D

@export var target_scene: String

@onready var fade_rect: ColorRect = get_parent().get_node("CanvasLayer/FadeRect")

var is_teleporting := false

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return

	if is_teleporting:
		return

	is_teleporting = true
	$CollisionShape2D.disabled = true

	await fade_out()
	get_tree().change_scene_to_file(target_scene)

func fade_out() -> void:
	fade_rect.visible = true
	fade_rect.modulate.a = 0.0

	var tween := create_tween()
	tween.tween_property(
		fade_rect,
		"modulate:a",
		1.0,
		0.6
	)
	await tween.finished
