extends Node2D

func _ready():
	$Label.visible = false
	$Label.position = Vector2(300, 300)
	GameState.prestige_triggered.connect(_on_prestige)

func _on_prestige():
	$Label.visible = true
	$Label.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.2).timeout
	$Label.modulate = Color(1, 1, 1)
	await get_tree().create_timer(0.2).timeout
	$Label.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.2).timeout
	$Label.modulate = Color(1, 1, 1)
	await get_tree().create_timer(2.0).timeout
	$Label.visible = false
