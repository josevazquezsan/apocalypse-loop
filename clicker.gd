extends Node2D
var money = 0 

func _ready():
	
	$Button.pressed.connect(_on_button_pressed
)

func _on_button_pressed():
	GameState.add_money(1.0)
	GameState.add_ore("stone", 1)
	print("Clicked! Money: ",
GameState.money)
