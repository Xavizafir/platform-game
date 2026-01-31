extends Area2D

@export var target_scene: String

@onready var fade_rect = get_tree().current_scene.get_node("CanvasLayer/FadeRect")

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return

	$CollisionShape2D.disabled = true
	await fade_out()
	get_tree().change_scene_to_file(target_scene)


func fade_out() -> void:
	fade_rect.visible = true
	fade_rect.modulate.a = 0.0

	var tween = get_tree().create_tween()
	tween.tween_property(
		fade_rect,
		"modulate:a",
		1.0,
		0.6
	)
	await tween.finished
