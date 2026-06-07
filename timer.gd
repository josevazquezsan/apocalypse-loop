extends Node2D

func _ready():
	$Timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	GameState.add_money(0.5)
	print("Automatic money collection：", GameState.money)
