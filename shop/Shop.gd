extends Control

@onready var container = $ScrollContainer/VBoxContainer

const UpgradeItem = preload("res://shop/UpgradeItem.tscn")

func _ready():
	for id in GameManager.upgrades:
		var item = UpgradeItem.instantiate()
		container.add_child(item)
		item.setup(id, GameManager.upgrades[id])

func _on_shop_button_pressed():
	visible = !visible
