extends HBoxContainer

@onready var name_label = $VBoxContainer/NameLabel
@onready var desc_label = $VBoxContainer/DescLabel
@onready var cost_label = $CostLabel
@onready var buy_button = $BuyButton

var upgrade_id : String = ""

func setup(id: String, data: Dictionary):
	upgrade_id = id
	name_label.text = data["name"]
	desc_label.text = data["description"]
	cost_label.text = str(data["cost"]) + " $"

func _process(_delta):
	buy_button.disabled = GameManager.money < GameManager.upgrades[upgrade_id]["cost"]
	if GameManager.upgrades[upgrade_id]["bought"]:
		buy_button.text = "✓ Acheté"
		buy_button.disabled = true

func _on_buy_button_pressed():
	GameManager.buy_upgrade(upgrade_id)
